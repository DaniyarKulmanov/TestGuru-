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
    gist = GistQuestionService.new(@question).call
    @gist = Gist.new(html_url: gist[:html_url], guid: gist[:id], user: current_user, question: @question)

    flash_options = if gist.nil?
      { alert: t('.failure') }
    else
      if @gist.save
        { notice: view_context.link_to( t('.success'), gist.html_url, target: :_blank ) }
      else
        GistQuestionService.new(@gist.question).uncall(@gist.guid)
        { alert: t('.failure') }
      end
    end

    redirect_to Result.current_try(current_user, @question), flash_options
  end

  def destroy
    @gist.destroy
    GistQuestionService.destroy(@gist.guid)

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
