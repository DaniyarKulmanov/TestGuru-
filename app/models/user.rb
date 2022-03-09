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
  has_many :passed_results, -> { where passed: true }, class_name: 'Result'
  has_many :passed_tests, through: :passed_results, class_name: 'Test', source: :test
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists, dependent: :destroy

  has_many :earnings, dependent: :destroy
  has_many :badges, through: :earnings

  validates :email, :first_name, :last_name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def test_by_level(level)
    Test.joins(:results).where(level: level, results: { user_id: id })
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
