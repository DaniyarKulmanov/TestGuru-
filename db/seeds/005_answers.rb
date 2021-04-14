# frozen_string_literal: true

answers_count = Question.all.size

answers_count.times do
  Answer.find_or_create_by(correct: [true, false].sample, question_id: Question.all.sample.id)
end
