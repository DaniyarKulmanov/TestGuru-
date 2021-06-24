# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:original_path]
    else
      flash.now[:alert] = 'Enter email and password'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
