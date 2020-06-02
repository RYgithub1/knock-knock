Rails.application.routes.draw do
  devise_for :users

  root to: "maps#index"
  resource :maps, only: [:index]



end
