# frozen_string_literal: true

module QuestionsHelper
  ACTION_HEADER = { new: 'Create New', edit: 'Edit' }.freeze

  def question_header
    "#{ACTION_HEADER[params[:action].to_sym]} #{@question.test.title} Question"
  end
end
