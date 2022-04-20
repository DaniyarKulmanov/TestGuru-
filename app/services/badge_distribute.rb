# frozen_string_literal: true

class BadgeDistribute
  # TODO: add all rule specifications to constant RULES
  RULES = {
    category: PassedCategoriesRule
  }.freeze

  def initialize(result)
    @result = result
  end

  # TODO: try to use send
  def call
    Badge.select do |badge|
      rule_specification = RULES[badge.criteria.to_sym].new(parameter: badge.parameter, result: @result)
      grand_badge(badge) if rule_specification.satisfied?
    end
  rescue NoMethodError
    t('.services.badge.errors.criteria')
  end

  private

  def grand_badge(badge)
    @result.user.badges << badge
  end
end
