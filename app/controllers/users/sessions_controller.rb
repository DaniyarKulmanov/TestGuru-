# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message! :notice, :signed_up, { first_name: resource.first_name, last_name: resource.last_name }
  end
end
