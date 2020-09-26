class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:zenkaku_familyname, :zenkaku_name, :katakana_family_kana, :katakana_name_kana, :email, :nickname, :birthday]
      )
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'layout' && password == 'christmas'
    end
  end
end
