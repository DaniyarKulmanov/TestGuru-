# frozen_string_literal: true

class GitHubClient
  def initialize
    @client = Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def publish_gist(gist_params)
    gist = @client.create_gist(gist_params)
  end

  def destroy(gist)
    @client.delete_gist(gist)
  end
end
