# frozen_string_literal: true

class Badge < ApplicationRecord
  CRITERIA = [['completed'], ['first_try'], ['backend']]

  belongs_to :author, class_name: 'User'

  validates :name, :filename, presence: true
end
