# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @feedback = FeedbackForm.new(feedback_params)


    if @feedback.save
      flash[:alert] = t('.success')
      FeedbacksMailer.created_notification(current_user, @feedback.body).deliver_now
      redirect_to root_path
    else
      flash[:alert] = t('.failure')
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
