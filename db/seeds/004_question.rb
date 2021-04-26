# frozen_string_literal: true

require_relative '003_tests'

10.times do
  random = rand(1..100).to_s
  Question.find_or_create_by(body: "Body#{random}", test: Test.all.sample)
end
