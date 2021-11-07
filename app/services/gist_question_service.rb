class GistQuestionService

  def initialize(result, client: nil)
    @question = result.current_question
    @test = @question.test
    @user = result.user
    @client = client || GitHubClient.new
  end

  def call
    @published_gist = @client.publish_gist(gist_params, @question, @user)
  end

  private

# TODO: make internationalization to text
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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
