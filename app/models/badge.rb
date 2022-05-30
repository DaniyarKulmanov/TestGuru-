# frozen_string_literal: true

class Badge < ApplicationRecord
  ATTEMPTS = ('1'..'10').freeze

  # TODO: rename criteria according to rule specifications
  enum criteria: { category: 0, attempts: 1, named: 2, level: 3 }, _prefix: true

  has_many :earnings, dependent: :destroy
  has_many :users, through: :earnings

  validates :name, :filename, presence: true
  validates :criteria, uniqueness: { scope: :parameter }
end
