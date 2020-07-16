module ControllerMacros

  # deviseを用いて「ログインをする」ための、テスト用loginメソッド
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

end