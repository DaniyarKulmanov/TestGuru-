class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    @user = current_user
    @body = params[:feedback][:body]

    if @body.present?
      flash[:alert] = t('.success')
      FeedbacksMailer.created_notification(@user, @body).deliver_now
      redirect_to root_path
    else
      flash[:alert] = t('.failure')
      render :new
    end
  end
end
