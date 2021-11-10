# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_gist, only: :destroy
  before_action :set_question, only: :create

  def index
    @gists = Gist.all
  end

  def create
    @question = Question.find(params[:question_id])
    published_gist = GistQuestionService.new(@question).call
    @gist = Gist.new

    # move this to gist_params?
    @gist.html_url = published_gist[:html_url]
    @gist.guid = published_gist[:id]
    @gist.user = current_user
    @gist.question = @question

    flash_options = if published_gist.nil?
      { alert: t('.failure') }
    else
      if @gist.save
        { notice: view_context.link_to( t('.success'), published_gist.html_url, target: :_blank ) }
      else
        GitHubClient.new.destroy(@gist.guid)
        { alert: t('.failure') }
      end
    end

    redirect_to Result.last, flash_options
  end

  def destroy
    @gist.destroy
    GitHubClient.new.destroy(@gist.guid)

    redirect_to admin_gists_path
  end

private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_gist
    @gist = Gist.find(params[:id])
  end
end
