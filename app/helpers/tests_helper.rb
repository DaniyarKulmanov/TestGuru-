# frozen_string_literal: true

module TestsHelper
  def start_button(test)
    if test.questions.empty?
      'No questions found for test'
    else
      button_to 'start', begin_test_path(test)
    end
  end
end
