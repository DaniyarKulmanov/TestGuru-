# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(:desc) }

  has_many :tests, dependent: :destroy
end
