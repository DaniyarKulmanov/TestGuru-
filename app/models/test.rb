# frozen_string_literal: true

# TODO: add only completed tests class method
class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, message: 'Title and level must be uniq' }

  scope :beginner, -> { where(level: 0..1) }
  scope :advanced, -> { where(level: 2..4) }
  scope :pro, -> { where(level: 5..Float::INFINITY) }

  def self.by_category(category)
    joins(:category)
      .where(category: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
