# frozen_string_literal: true

# TODO: bug if new test added to category, need to finish new test as many times as old tests
module BadgeRules
  class PassedCategoriesRule < AbstractRuleSpecification

    def initialize(parameter:, result:)
      super
      @category_tests = {}
      next_progress
    end

    def satisfied?
      if category_tests.empty?
        false
      else
        category_tests == user_passed_category_tests
      end
    end

    private

    attr_accessor :category_tests

    def next_progress
      Test.by_category(parameter).each { |test| category_tests[test] = (earned_category_badges('0') + 1) }
    end

    def earned_category_badges(criteria)
      result.user.badges.where(criteria: criteria, parameter: parameter).count
    end

    def user_passed_category_tests
      result.user.passed_tests.by_category(parameter).tally
    end
  end
end
