# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :proper, -> { where(correct: true) }

  validates :correct, :body, presence: true
end
