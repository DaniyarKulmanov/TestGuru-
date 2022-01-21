class FeedbacksController < ApplicationController
  def new

  end
  # TODO refactor to custom action send_mail
  def create
    render plain: 'Feedback sent'
  end
end
