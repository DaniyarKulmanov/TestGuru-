# frozen_string_literal: true

module ResultsHelper
  def attempt_information
    result = @result.count_passage_result
    @result.passed? ? "<p span class='positive'>#{result}</p>".html_safe : "<p span class='negative'>#{result}</p>".html_safe
  end
end
