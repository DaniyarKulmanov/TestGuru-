# frozen_string_literal: true

class Test < ApplicationRecord

  INFINITE = Float::INFINITY

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :beginner, -> { where(level: 0..1) }
  scope :advanced, -> { where(level: 2..4) }
  scope :pro, -> { where(level: 5..INFINITE) }
  scope :by_category, lambda { |category|
    joins(:category).where(category: { title: category }).order(title: :desc).pluck(:title)
  }
end
