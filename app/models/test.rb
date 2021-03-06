# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, message: 'Title and level must be uniq' }
  validates_numericality_of :timer, greater_than: 0

  scope :beginner, -> { where(level: 0..1) }
  scope :advanced, -> { where(level: 2..4) }
  scope :pro, -> { where(level: 5..Float::INFINITY) }

  class << self
    def by_category(category_id)
      where(category_id: category_id)
        .order(title: :desc)
        .pluck(:title)
    end

    def only_filled
      includes(:questions)
        .where.not(questions: { id: nil })
        .sort
    end

    def levels
      pluck(:level).map(&:to_s)
    end

    def by_level(level)
      where(level: level)
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
