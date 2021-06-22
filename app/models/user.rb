# frozen_string_literal: true

class User < ApplicationRecord

  include Auth

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def test_by_level(level)
    Test.joins(:results).where(level: level, results: { user_id: id })
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
