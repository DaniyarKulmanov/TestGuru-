# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(result)
    @user = result.user
    @test = result.test

    mail to: @user.email, subject: 'Congratulations you are now a Guru'
  end
end
