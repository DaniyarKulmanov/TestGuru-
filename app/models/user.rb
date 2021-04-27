# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  scope :test_by_level, lambda { |level, id|
    joins(:tests, :results).where(tests: { level: level }, results: { user_id: id })
  }
end
