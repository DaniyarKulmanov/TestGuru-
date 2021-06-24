# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  private

  def authenticate_user!
    redirect_to login_path, alert: 'Enter email and password' unless current_user
    cookies[:email] = current_user&.email
    cookies[:original_path] = request.path
  end
end
