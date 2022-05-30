# frozen_string_literal: true

class AbstractRuleSpecification
  def initialize(badge:, result:)
    @badge = badge
    @result = result
  end

  def satisfied?
    result.user.badges.exclude?(badge)
  end

  private

  attr_reader :badge, :result
end
