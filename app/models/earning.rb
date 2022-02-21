# frozen_string_literal: true

class Earning < ApplicationRecord
  belongs_to :user
  belongs_to :badge
end
