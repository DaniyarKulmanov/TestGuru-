# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: [:show]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.save ? (redirect_to @test) : (render :new)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
