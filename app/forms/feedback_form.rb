# frozen_string_literal: true

class FeedbackForm
  include ActiveModel::Model

  attr_accessor :body

  validates :body, presence: true

  def initialize(params = {})
    @body = params[:body]
  end

  def save
    valid?
  end
end
