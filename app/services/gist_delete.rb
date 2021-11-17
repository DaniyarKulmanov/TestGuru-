# frozen_string_literal: true

class GistDelete < GistQuestionService
  Response = Struct.new(:id, :success?)

  def initialize(gist, client = default_client)
    super(client)
    @gist = gist
  end

  def call
    Response.new(@gist, @client.delete_gist(@gist))
  end
end
