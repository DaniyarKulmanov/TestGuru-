# frozen_string_literal: true

TESTS = %w[Ruby Rails Go Vue].freeze
USERS = User.all
CATEGORIES = Category.all

TESTS.each do |test|
  user = USERS.sample.id
  category = CATEGORIES.sample.id
  level = rand(0..3)
  Test.find_or_create_by(title: test, level: level, author_id: user, category_id: category)
end
