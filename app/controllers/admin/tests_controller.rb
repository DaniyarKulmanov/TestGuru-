# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy begin update_inline ]

  def index
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    set_author

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render :index
    end
  end

  def destroy
    @test.destroy

    redirect_to root_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_tests
    @tests = Test.only_filled
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_author
    @test.author = current_user
  end
end
