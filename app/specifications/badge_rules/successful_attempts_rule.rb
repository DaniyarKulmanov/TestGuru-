# frozen_string_literal: true

module BadgeRules
  class SuccessfulAttemptsRule < AbstractRuleSpecification

    def initialize(badge:, result:)
      super
      @total_attempts = Result.where(user: result.user, test: result.test)
    end

    def satisfied?
      if total_attempts[badge.parameter.to_i - 1].present? && super
        total_attempts[badge.parameter.to_i - 1].passed?
      else
        false
      end
    end

    private

    attr_reader :total_attempts
  end
end
