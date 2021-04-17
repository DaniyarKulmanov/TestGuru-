# frozen_string_literal: true

users = User.ids
tests = Test.ids

5.times do
  Result.find_or_create_by(user_id: users.sample, test_id: tests.sample)
end
