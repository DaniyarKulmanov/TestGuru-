# frozen_string_literal: true

class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
  end
end
