# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @gists = Gist.all
  end

  def destroy
    @gist = Gist.find(params[:id])
    response = GistDelete.new(@gist.guid).call

    if response.success?
      flash[:notice] = t('.success', id: response.id)
      @gist.destroy
    else
      flash[:alert] = t('.failure')
    end

    redirect_to admin_gists_path
  end
end
