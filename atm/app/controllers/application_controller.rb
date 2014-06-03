# Application controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_credentials(card_number, pin)
    cookies[:card_number] = card_number
    cookies[:pin] = pin
  end

  def find_credentials
    Credentials.new(cookies[:card_number], cookies[:pin])
  end

end
