# frozen_string_literal: true

class User < ApplicationRecord

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  validates :name, :email, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def test_by_level(level)
    Test.joins(:results).where(level: level, results: { user_id: id })
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
