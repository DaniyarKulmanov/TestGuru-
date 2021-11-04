class GitHubClient
  # ACCESS_TOKEN = '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'

  def initialize
    @client = Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def create_gist(params)
    @client.create_gist(params)
  end

end
