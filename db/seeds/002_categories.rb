# frozen_string_literal: true

CATEGORY = %w[Syntax Back_end Front_end Modern].freeze
CATEGORY.each do |category|
  Category.find_or_create_by(title: category)
end

