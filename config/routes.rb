Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  root to: "maps#index"

  resources :maps,     only: [:index]
  resources :abouts,   except: [:index]
  resources :pairs,    except: [:index, :edit, :update]
  resources :messages, only: [:index, :show]

  # resources :pairs do
  #   resources :messages
  # end

end
