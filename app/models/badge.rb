# frozen_string_literal: true

class Badge < ApplicationRecord
  enum criteria: { category: 0, attempts: 1, named: 2, level: 3 }, _prefix: true

  has_many :earnings, dependent: :destroy
  has_many :users, through: :earnings

  validates :name, :filename, presence: true
  validates :parameter, inclusion: { in: Category.pluck(:title) }, if: :criteria_category?
  validates :parameter, inclusion: { in: ('1'..'99 ')}, if: :criteria_attempts?
  validates :parameter, inclusion: { in: Test.pluck(:title) }, if: :criteria_named?
  validates :parameter, inclusion: { in: Test.all.map{|test| test.level.to_s} }, if: :criteria_level?

  # todo scopes
end
