# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:question, 'only 1 - 4 question allowed') unless answers.length.between?(1, 4)
  end
end
