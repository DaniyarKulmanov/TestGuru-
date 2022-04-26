# frozen_string_literal: true

class PassedTestsRule < AbstractRuleSpecification
  def satisfied?
    test?(parameter)
  end

  private

  def test?(parameter)
    result.test.title == parameter && result.passed
  end
end
