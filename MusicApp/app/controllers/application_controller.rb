class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  end

  def sign_in!(user)
  end

  def sign_out!
  end

  def signed_in?
  end
end
