# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :correct, inclusion: { in: [true, false] }

  scope :proper, -> { where(correct: true) }
end
