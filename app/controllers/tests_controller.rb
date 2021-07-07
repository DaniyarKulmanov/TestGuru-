# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.only_filled
  end

  def begin
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.result(@test)
  end
end
