# frozen_string_literal: true

# rule by category or level
module BadgeRules
  class PassedByRule < AbstractRuleSpecification
    def initialize(badge:, result:)
      super
      @tests_to_check = Test.send("by_#{badge.criteria}", badge.parameter)
      @user_tests = result.user.passed_tests.send("by_#{badge.criteria}", badge.parameter)
    end

    def satisfied?
      if tests_to_check.empty? || !super
        false
      else
        (tests_to_check & user_tests) == tests_to_check
      end
    end

    private

    attr_reader :tests_to_check, :user_tests
  end
end
