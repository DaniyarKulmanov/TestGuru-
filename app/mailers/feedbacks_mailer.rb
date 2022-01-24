# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def feedback_created_notification(user, body)
    @user = user
    @body = body

    mail(subject: t('.feedback', user: @user.email))
  end
end
