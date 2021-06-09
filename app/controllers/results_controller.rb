# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :set_result, only: %i[show attempt update]

  def show; end

  def attempt; end

  def update
    @result.accept!(params[:answer_ids])

    render :show
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
