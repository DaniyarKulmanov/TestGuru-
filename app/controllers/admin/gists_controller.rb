# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_gist, only: :destroy

  def index
    @gists = Gist.all
  end

  def destroy
    @gist.destroy
    GistQuestionService.destroy(@gist.guid)

    redirect_to admin_gists_path
  end

private

  def set_gist
    @gist = Gist.find(params[:id])
  end
end
