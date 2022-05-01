# frozen_string_literal: true

module BadgeRules
  class PassedTestsRule < AbstractRuleSpecification
    def satisfied?
      result.test.title == Test.find(parameter).title
    end
  end
end
