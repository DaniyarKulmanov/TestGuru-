# frozen_string_literal: true

module ResultsHelper
  def attempt_information
    score = @result.score

    if @result.passed
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

  def progressbar_html
    content_tag(:div,
                content_tag(:div, nil,
                            class: 'progress-bar',
                            'aria-valuemax' => 100,
                            'aria-valuemin' => 0,
                            'aria-valuenow' => 0,
                            'role' => 'progressbar',
                            'style' => 'width: 0%',
                            data: { questions_max: @result.test.questions.length,
                                    current_question_number: @result.test.questions.find_index(@result.current_question) }),
                class: 'progress')
  end

  def timer_html
    content_tag(:div, nil,
                id: 'timer',
                data: { duration: @result.test.timer,
                        attempt_url: attempt_result_path(@result),
                        count_down_date: @result.created_at.utc.iso8601 })
  end
end
