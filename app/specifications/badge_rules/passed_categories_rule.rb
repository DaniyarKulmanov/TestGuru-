# frozen_string_literal: true

module BadgeRules
  class PassedCategoriesRule < AbstractRuleSpecification

    def initialize(parameter:, result:)
      super
      @category_tests = {}
      next_progress
    end

    def satisfied?
      category_tests == user_passed_category_tests && !category_tests.empty?
    end

    private

    attr_accessor :category_tests

    # def category?
    #   next_progress
    #   category_tests == user_passed_category_tests
    # end

    # move to abstract rule ?
    # def count_badges
    #   result.user.badges.count { |badge| badge.criteria_category? && badge.parameter.to_i == 14 }
    # end

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
