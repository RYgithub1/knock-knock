class ApplicationController < ActionController::Base

  # for cross-site request forgeries
  protect_from_forgery with: :exception

  # ログインユーザのみアクセス許可 [#indexは許可]
  before_action :authenticate_user!, except: [:index]

  # strong parameter for devise
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
