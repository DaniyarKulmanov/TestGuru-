# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show attempt update gist]

  def show; end

  def attempt; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to attempt_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question).call

    flash_options = if result[:html_url].nil?
      { alert: t('.failure') }
    else# TODO: clickable link
      { notice: t('.success', url: result[:html_url].html_safe) }
    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
