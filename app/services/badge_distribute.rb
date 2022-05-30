# frozen_string_literal: true

class BadgeDistribute
  RULES = {
    category: BadgeRules::PassedByRule,
    attempts: BadgeRules::SuccessfulAttemptsRule,
    named: BadgeRules::PassedTestsRule,
    level: BadgeRules::PassedByRule
  }.freeze

  def initialize(result)
    @result = result
  end

  def call
    Badge.select do |badge|
      rule_specification = RULES[badge.criteria.to_sym].new(badge: badge, result: @result)
      grand_badge(badge) if rule_specification.satisfied?
    end
  rescue NoMethodError
    I18n.t('.services.badge.errors.criteria')
  end

  private

  def grand_badge(badge)
    @result.user.badges << badge
  end
end
