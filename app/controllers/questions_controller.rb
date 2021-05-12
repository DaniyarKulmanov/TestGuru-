# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: :create

  def create
    @question = @test.questions.create(question_params)
    redirect_to test_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
