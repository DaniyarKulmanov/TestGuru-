# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  # has_many :comments

  def test_by_level(level)
    Test.joins('INNER JOIN results on results.test_id = tests.id')
        .where('results.user_id' => id, level: level)
  end
end
