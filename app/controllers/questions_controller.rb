# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show create]
  rescue_from ::ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def show; end

  def create
    @question = @test.questions.create(question_params)
    # redirect_to test_path(@test)
    render html: '<h1>Question created</h1>'.html_safe
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
