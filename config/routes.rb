Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  root to: "maps#index"
  # resources :users, only: [:index, :edit, :update]

  resources :abouts, except: [:index]

  # resources :pairs do
  #   resources :messages
  # end
  resources :pairs, except: [:index]
  resources :messages

end
