# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :proper, -> { where(correct: true) }

  validates :body, presence: true
  validates :correct, inclusion: { in: [true, false] }
  validate :validate_answers_count, if: :question_exist?

  private

  def validate_answers_count
    errors.add(:question, 'only 1 - 4 question allowed') unless (1..4).include?(question.answers.size)
    puts (1..4).include?(question.answers.size)
  end

  def question_exist?
    !question.nil?
  end
end
