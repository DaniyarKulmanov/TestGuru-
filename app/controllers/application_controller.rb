# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end

  def default_url_options
    if I18n.default_locale == I18n.locale
      { lang: I18n.locale }
    else
      params[:lang].nil? ? {} : { lang: params[:lang] }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
