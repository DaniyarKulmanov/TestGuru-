# frozen_string_literal: true

module ResultsHelper
  def attempt_information
    score = @result.score
    if @result.passed?
      status = 'positive'
      result = "Passed score: #{score}"
    else
      status = 'negative'
      result = "Not passed score: #{score}"
    end
    "<p span class=#{status}>#{result}</p>".html_safe
  end
end
