# frozen_string_literal: true

class Badge < ApplicationRecord
  ATTEMPTS = ('1'..'10').freeze

  enum criteria: { category: 0, attempts: 1, named: 2, level: 3 }, _prefix: true

  has_many :earnings, dependent: :destroy
  has_many :users, through: :earnings

  validates :name, :filename, presence: true

  # TODO: move to FormObject
  # TODO: Bug - parameters switching to category after validation error
  validates :parameter, inclusion: { in: Category.pluck(:id).map(&:to_s) }, if: :criteria_category?
  validates :parameter, inclusion: { in: ATTEMPTS }, if: :criteria_attempts?
  validates :parameter, inclusion: { in: Test.pluck(:id).map(&:to_s) }, if: :criteria_named?
  validates :parameter, inclusion: { in: Test.levels }, if: :criteria_level?
  validates :criteria, uniqueness: { scope: :parameter }
end
