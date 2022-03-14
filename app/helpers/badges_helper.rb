# frozen_string_literal: true

module BadgesHelper
  def human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.badge.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
