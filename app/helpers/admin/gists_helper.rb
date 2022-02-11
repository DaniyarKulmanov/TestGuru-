# frozen_string_literal: true

module Admin::GistsHelper
  def short(body)
    truncate(body, length: 25)
  end
end
