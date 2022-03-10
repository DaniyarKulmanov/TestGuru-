# frozen_string_literal: true

class Badge::BadgeDistribute
  def initialize(user)
    @user = user
  end

  def call
    Badge.select do |badge|
      user.badges.push(badge) if send(badge.criteria, badge.parameter)
    end
  rescue NoMethodError
    t('.services.badge.errors.criteria')
  end

  private

  attr_reader :user

  def category(parameter)
    (Test.by_category(parameter) - user.passed_tests.by_category(parameter)).empty?
  end

  def attempts(parameter)
    user.passed_tests.count == parameter.to_i
  end

  def named(parameter)
    result = user.results.last
    result.test.title == parameter && result.passed
  end

  def level(parameter)
    (Test.where(level: parameter).count - user.passed_tests.where(level: parameter).count) <= 0
  end
end
