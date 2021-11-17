# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @result = Result.find(params[:result_id])
    @question = @result.current_question

    result = Gist::GistCreate.new(@question).call

    if result.success?
      flash[:notice] = view_context.link_to(t('.success'), result.url, target: :_blank)
      @gist = Gist.create(html_url: result.url, guid: result.id, user: current_user, question: @question)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @result
  end
end
