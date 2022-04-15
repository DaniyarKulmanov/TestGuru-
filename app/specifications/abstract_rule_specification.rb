# frozen_string_literal: true

class AbstractRuleSpecification

  def initialize(parameter:, result:)
    @parameter = parameter
    @result = result
  end

  def satisfied_by?
    raise "#{__method__} undefined for #{self.class}"
  end
end
