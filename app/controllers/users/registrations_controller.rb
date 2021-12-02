# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication
  before_action :resource_name

  def resource_name
    :user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end
end
