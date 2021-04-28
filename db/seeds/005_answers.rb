# frozen_string_literal: true

question = Question.all
answers_count = question.size

BOOLEAN = [true, false].freeze

answers_count.times do
  random = rand(1..100).to_s
  Answer.find_or_create_by(correct: BOOLEAN.sample, question: question.sample, body: random )
end
