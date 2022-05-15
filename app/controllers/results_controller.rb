# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show attempt update gist]
  around_action :check_time, only: :show

  def show; end

  def attempt; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      BadgeDistribute.new(@result).call

      redirect_to attempt_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def check_time
    redirect_to attempt_result_path(@result) if (@result.created_at.time + 3.seconds) > Time.now
  end
end
