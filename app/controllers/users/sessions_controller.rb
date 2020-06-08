# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  #ログイン後のリダイレクト先
  # The path used after Log In
  def after_sign_in_path_for(resource)
    root_path
    # about_path(about.id?current_user.id?current_user?)
    # abouts#showにに飛ばす為にid付記が必要では
    # FIXME: abouts#show作成後に指定。root_pathを仮置き
  end


  #ログアウト後のリダイレクト先
  # The path used after Log Out
  def after_sign_out_path_for(resource)
    root_path
  end

end
