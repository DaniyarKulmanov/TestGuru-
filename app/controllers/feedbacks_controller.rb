class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    flash[:alert] = t('.success')
    redirect_to root_path
  end
end