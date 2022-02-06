# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @body = params[:feedback][:body]
    # TODO use FeedbackForm, @feedback_form.save?
    if @body.present?
      flash[:alert] = t('.success')
      FeedbacksMailer.created_notification(current_user, @body).deliver_now
      redirect_to root_path
    else
      flash[:alert] = t('.failure')
      render :new
    end
  end
end
