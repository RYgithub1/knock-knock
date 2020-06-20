Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  root to: "maps#index"
  resources :maps, only: [:index]

  resources :abouts, except: [:index] do
    resource :hangers, only: [:create, :destroy]
  end

  resources :pairs, except: [:show, :edit, :update] do
    resources :messages, only: [:index, :create]
  end


end
