# frozen_string_literal: true

module BadgeRules
  class SuccessfulAttemptsRule < AbstractRuleSpecification
    def satisfied?
      attempts?(parameter)
    end

    private

    def attempts?(parameter)
      user.passed_tests.count == parameter.to_i
    end
  end
end