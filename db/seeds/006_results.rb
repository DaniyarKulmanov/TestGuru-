# frozen_string_literal: true

users = User.all
tests = Test.all

# TODO refactor seed for results
5.times do
  Result.find_or_create_by(user: users.sample, test: tests.sample)
end
