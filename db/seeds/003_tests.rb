# frozen_string_literal: true

TESTS = %w[Ruby Rails Go Vue].freeze
USERS = User.all
CATEGORIES = Category.all

TESTS.each do |test|
  user = USERS.all.sample
  category = CATEGORIES.all.sample
  level = rand(0..3)
  Test.find_or_create_by(title: test, level: level, author: user, category: category)
end
