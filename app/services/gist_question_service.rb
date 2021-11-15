# frozen_string_literal: true

class GistQuestionService
  def self.destroy(gist)
    token = ENV.fetch('GIST_CREATE_TOKEN')
    Octokit::Client.new(access_token: token ).delete_gist(gist)
  end

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
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
    content = [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
