# frozen_string_literal: true

class GistDelete < GistQuestionService
  Gist = Struct.new(:id, :success?)

  def initialize(id, client = default_client)
    super(client)
    @id = id
  end

  def call
    Gist.new(@id, @client.delete_gist(@id))
  end
end
