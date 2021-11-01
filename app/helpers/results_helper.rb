# frozen_string_literal: true

module ResultsHelper
  def attempt_information
    score = @result.score
    if @result.passed?
      status = 'positive'
      result = t('results.passed', score: score)
    else
      status = 'negative'
      result = t('results.not_passed', score: score)
    end
    "<p span class=#{status}>#{result}</p>".html_safe
  end

  def correct_path(user)
    if user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end
end
