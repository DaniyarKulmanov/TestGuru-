# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @result = Result.find(params[:result_id])
    @question = @result.current_question

    response = GistCreate.new(@question).call

    if response.success?
      flash[:notice] = view_context.link_to(t('.success'), response.url, target: :_blank)
      @gist = Gist.new(html_url: response.url, guid: response.id, user: current_user, question: @question)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @result
  end
end
