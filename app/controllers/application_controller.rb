# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[name email password password_confirmation tel comment]
    )
    devise_parameter_sanitizer.permit(
      :sign_in, keys: %i[email password]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[name email current_password password password_confirmation tel comment]
    )
  end
end
