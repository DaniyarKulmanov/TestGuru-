# frozen_string_literal: true

class Result < ApplicationRecord
  SUCCESS_RATIO = 85
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  after_initialize

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = (timer_exceeded? ? nil : next_question)
    self.passed = score >= SUCCESS_RATIO && completed?
    save!
  end

  def completed?
    current_question.nil?
  end

  def score
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def timer_exceeded?
    Time.zone.now >= created_at + test.timer * 60
  end
end
