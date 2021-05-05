# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :name, :email, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def test_by_level(level)
    Test.joins(:results).where(level: level, results: { user_id: id })
  end
end
