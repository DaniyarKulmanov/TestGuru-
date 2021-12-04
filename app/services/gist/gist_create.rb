# frozen_string_literal: true

class Gist::GistCreate < Gist::GistQuestionService
  Gist = Struct.new(:url, :id, :success?)

  def initialize(question, client = default_client)
    super(client)
    @question = question
    @test = @question.test
  end

  def call
    result = @client.create_gist(gist_params)
    Gist.new(result.html_url, result.id, result.url.present?)
  end

  private

  def gist_params
    {
      description: I18n.t('.gist_question', title: @test.title),
      files: {
        I18n.t('.gist_filename') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
