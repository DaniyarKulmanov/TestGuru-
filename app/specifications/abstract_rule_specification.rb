# frozen_string_literal: true

class AbstractRuleSpecification
  def initialize(parameter:, result:)
    @parameter = parameter
    @result = result
  end

  def satisfied?
    raise "#{__method__} undefined for #{self.class}"
  end

  private

  attr_reader :parameter, :result
end
