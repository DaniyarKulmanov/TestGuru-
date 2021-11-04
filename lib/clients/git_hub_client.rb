class GitHubClient

  def initialize
    @client = Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def create_gist(params)
    gist = @client.create_gist(params)
  end

end
