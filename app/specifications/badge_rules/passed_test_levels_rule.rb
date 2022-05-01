# frozen_string_literal: true

module BadgeRules
  class PassedTestLevelsRule < AbstractRuleSpecification
    def initialize(parameter:, result:)
      super
      @level_tests = {}
      next_progress
    end

    def satisfied?
      if level_tests.empty?
        false
      else
        level_tests == user_passed_category_tests
      end
    end

    private

    attr_accessor :level_tests

    def next_progress
      Test.by_level(parameter).each { |test| level_tests[test] = (earned_level_badges(Badge.criteria[:level]) + 1) }
    end

    def earned_level_badges(criteria)
      result.user.badges.where(criteria: criteria, parameter: parameter).count
    end

    def user_passed_category_tests
      result.user.passed_tests.by_level(parameter).tally
    end
  end
end
