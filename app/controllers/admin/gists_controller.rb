# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @gists = Gist.all
  end

  def destroy
    @gist = Gist.find(params[:id])
    @gist.destroy
    GistQuestionService.destroy(@gist.guid)

    redirect_to admin_gists_path
  end
end
