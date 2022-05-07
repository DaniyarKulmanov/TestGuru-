# frozen_string_literal: true

module BadgeRules
  class PassedCategoriesRule < AbstractRuleSpecification

    def initialize(badge:, result:)
      super
      @category_tests = Test.by_category(badge.parameter.to_i)
      @user_category_tests = result.user.passed_tests.by_category(badge.parameter.to_i)
    end

    def satisfied?
      if category_tests.empty? || !super
        false
      else
        (category_tests & user_category_tests) == category_tests
      end
    end

    private

    attr_reader :category_tests, :user_category_tests
  end
end
