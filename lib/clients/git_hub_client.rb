# frozen_string_literal: true

class GitHubClient
  def initialize
    @client = Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def publish_gist(gist_params, question, user)
    gist = @client.create_gist(gist_params)
    register_gist(gist, question, user)
  end

  private

  def register_gist(gist, question, user)
    Gist.create(
      html_url: gist[:html_url],
      guid: gist[:id],
      user: user,
      question: question
    )
  end
end
