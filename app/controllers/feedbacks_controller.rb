class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    @user = current_user
    @body = params[:feedback][:body]

    flash[:alert] = t('.success')

    FeedbacksMailer.created_notification(@user, @body).deliver_now
    redirect_to root_path
  end
end
