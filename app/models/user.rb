# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists, dependent: :destroy
  has_many :badges, dependent: :destroy

  validates :email, :first_name, :last_name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def test_by_level(level)
    Test.joins(:results).where(level: level, results: { user_id: id })
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
