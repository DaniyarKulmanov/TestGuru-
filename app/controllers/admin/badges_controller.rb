# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    set_author

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('success', name: @badge.name)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_author
    @badge.author = current_user
  end

  def badge_params
    params.require(:badge).permit(:name, :filename, :criteria)
  end
end