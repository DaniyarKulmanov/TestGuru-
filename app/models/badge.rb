# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :user

  validates :name, :filename, presence: true
end
