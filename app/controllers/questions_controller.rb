# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :set_test, only: %i[new create edit]
  rescue_from ::ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  # TODO fix errors with form_with
  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to test_path(@question.test)
  end

  private

  def set_test
    @test = @question.nil? ? Test.find(params[:test_id]) : @question.test
  end

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
