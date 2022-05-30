# frozen_string_literal: true

class BadgeForm
  include ActiveModel::Model

  attr_accessor :name, :filename, :criteria, :parameter
  attr_reader :badge

  validates :parameter, inclusion: { in: Category.pluck(:id).map(&:to_s) }, if: :criteria_category?
  validates :parameter, inclusion: { in: Badge::ATTEMPTS }, if: :criteria_attempts?
  validates :parameter, inclusion: { in: Test.pluck(:id).map(&:to_s) }, if: :criteria_named?
  validates :parameter, inclusion: { in: Test.levels }, if: :criteria_level?

  def initialize(params = {})
    super(params)
    @badge = Badge.new(params)
  end

  def save
    return false if invalid?

    @badge.save
  end

  private

  def criteria_category?
    @badge.criteria_category?
  end

  def criteria_attempts?
    @badge.criteria_attempts?
  end

  def criteria_named?
    @badge.criteria_named?
  end

  def criteria_level?
    @badge.criteria_level?
  end
end
