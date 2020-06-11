Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  root to: "maps#index"
  # resources :users, only: [:edit, :update]

  # resources :maps, only: [:index]
  resources :abouts, except: [:index]

  resources :pairs, except: [:edit, :update]

  resources :messages, only: [:index]

end
