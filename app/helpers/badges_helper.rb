# frozen_string_literal: true

module BadgesHelper
  def human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.badge.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def parameter_name(badge)
    category_or_named?(badge) ? read_parameter_name(badge) : badge.parameter
  end

  private

  def read_parameter_name(badge)
    if badge.criteria_category?
      Category.find(badge.parameter).title
    else
      Test.find(badge.parameter).title
    end
  end

  def category_or_named?(badge)
    badge.criteria_category? || badge.criteria_named?
  end
end
