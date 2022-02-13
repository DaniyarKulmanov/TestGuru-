# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, :filename, presence: true
end
