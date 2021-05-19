# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_test
  before_action :set_question, only: %i[show destroy]
  rescue_from ::ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: @test)
    render inline: '<li> All Questions: <%= @questions.each{ |question| question }%></li>'
  end

  def show
    render inline: 'Question: <%= @question.inspect %>'
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.create(question_params)
    redirect_to test_questions_path(@test)
  end

  def destroy
    byebug
    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = @test.questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
