# frozen_string_literal: true

NAMES = %w[John Daniyar Vasya Madiyar].freeze

NAMES.each do |name|
  User.find_or_create_by(name: name)
end
