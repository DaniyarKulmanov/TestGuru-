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
    self.current_question = next_question
    self.passed = passed? if completed?
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


  def distribute_badges
    give_badges if passed?
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

  def give_badges
    won_badge('first_try') if first_try?
    won_badge('completed_all') if completed_all_tests?
    won_badge('backend') if completed_backend?
  end

  def won_badge(criteria)
    user.badges.push(Badge.where(criteria: criteria))
  end

  def first_try?
    Result.where(test: test, user: user, passed: true).count == 1
  end

  def completed_all_tests?
    if user.badges.exists?(criteria: 'completed_all')
      false
    else
      (Test.all.ids - user.passed_tests.ids).empty?
    end
  end

  def completed_backend?
    if user.badges.exists?(criteria: 'backend')
      false
    else
      (Test.all.by_category('Back_end') - user.passed_tests.by_category('Back_end')).empty?
    end
  end

end
