# frozen_string_literal: true

class GistQuestionService
  def initialize(result, client = default_client)
    @question = result.current_question
    @test = @question.test
    @user = result.user
    @client = client
  end

  def call
    @client.publish_gist(gist_params, @question, @user)
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
    GitHubClient.new
  end
end
