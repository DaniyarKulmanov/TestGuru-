# frozen_string_literal: true

ids = Question.ids
answers_count = ids.size

BOOLEAN = [true, false].freeze

answers_count.times do
  Answer.find_or_create_by(correct: BOOLEAN.sample, question_id: ids.sample)
end
