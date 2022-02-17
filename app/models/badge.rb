# frozen_string_literal: true

class Badge < ApplicationRecord
  CRITERIA = %w( completed first_try backend).freeze

  belongs_to :author, class_name: 'User'

  has_many :earnings, dependent: :destroy
  has_many :users, through: :earnings

  validates :name, :filename, presence: true
  validates :criteria, presence: true, inclusion: { in: CRITERIA }, uniqueness: true
end
