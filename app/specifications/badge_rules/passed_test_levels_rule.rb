# frozen_string_literal: true

module BadgeRules
  class PassedTestLevelsRule < AbstractRuleSpecification
    def initialize(badge:, result:)
      super
      @level_tests = Test.by_level(badge.parameter.to_i)
      @user_level_tests = result.user.passed_tests.by_level(badge.parameter.to_i)
    end

    def satisfied?
      if level_tests.empty? || !super
        false
      else
        (level_tests & user_level_tests) == level_tests
      end
    end

    private

    attr_accessor :level_tests, :user_level_tests
  end
end
