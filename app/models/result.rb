# frozen_string_literal: true

class Result < ApplicationRecord
  SUCCESS_RATIO = 85
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def passed?
    score >= SUCCESS_RATIO
  end

  def score
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  private

  # TODO: find first question with answers
  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  # TODO: undefined method `map' for nil:NilClass
  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  # TODO: find next question with answers
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
