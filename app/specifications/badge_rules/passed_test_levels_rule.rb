# frozen_string_literal: true

class PassedTestLevelsRule < AbstractRuleSpecification
  def satisfied?
    level?(parameter)
  end

  private

  def level?(parameter)
    (Test.where(level: parameter).count - user.passed_tests.where(level: parameter).count) <= 0
  end
end
