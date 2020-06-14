class ApplicationController < ActionController::Base
  # forCSRF
  protect_from_forgery with: :exception
  # ログインユーザのみアクセス許可
  # before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!
  # devise向けストロングパラメータ
  before_action :configure_permitted_parameters, if: :devise_controller?







  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
