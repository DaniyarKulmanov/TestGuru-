# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @result = Result.find(params[:result_id])
    gist_web = GistQuestionService.new(@result.current_question).call

    if gist_web[:url].present?
      flash[:notice] = view_context.link_to( t('.success'), gist_web.html_url, target: :_blank )
      @gist = Gist.new(html_url: gist_web[:html_url], guid: gist_web[:id], user: current_user, question: @question)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @result
  end
end
