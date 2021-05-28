# frozen_string_literal: true

module QuestionsHelper
  def question_header(test_title)
    @question.new_record? ? "Create New #{test_title} Question" : "Edit #{test_title} Question"
  end
end
