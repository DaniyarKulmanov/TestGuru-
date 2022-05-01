# frozen_string_literal: true

module BadgeRules
  class SuccessfulAttemptsRule < AbstractRuleSpecification
    def satisfied?
      user_result_all = Result.where(user: result.user, test: result.test)
      user_result_all[parameter.to_i - 1].passed == true if user_result_all[parameter.to_i - 1].present?
    end
  end
end
