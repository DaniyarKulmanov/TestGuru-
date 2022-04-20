# frozen_string_literal: true

module BadgeRules
  class PassedCategoriesRule < AbstractRuleSpecification
    def satisfied?
      category?(parameter)
    end

    private

    def category?(parameter)
      (Test.by_category(parameter) - result.user.passed_tests.by_category(parameter)).empty?
    end
  end
end
