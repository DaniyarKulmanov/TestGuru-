# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    question.new_record? ? "Create New #{question.test.title} Question" : "Edit #{question.test.title} Question"
  end
end
