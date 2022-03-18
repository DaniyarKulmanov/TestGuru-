# frozen_string_literal: true

class BadgeForm
  include ActiveModel::Model

  def initialize(params = {})
    @badge = params[:body]
  end
end
