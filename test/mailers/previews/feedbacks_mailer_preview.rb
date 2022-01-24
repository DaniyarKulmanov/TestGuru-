# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview
  def feedback_created_notification
    @user = User.first
    @body = 'Test text'

    FeedbacksMailer.feedback_created_notification(@user, @body)
  end
end
