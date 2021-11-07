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
    resposne = GistQuestionService.new(@result).call

    flash_options = if resposne.nil?
      { alert: t('.failure') }
    else# TODO: clickable link
      { notice: t('.success', url: resposne.url) }
    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

end
