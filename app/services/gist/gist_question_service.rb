# frozen_string_literal: true

class Gist::GistQuestionService
  def initialize(client = default_client)
    @client = client
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GIST_CREATE_TOKEN'))
  end
end
