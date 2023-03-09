Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "pages#dashboard"
  get "events/current", to: "events#current", as: :current_event
  resources :events do
    resources :participations, only: %i[new create]
  end
  resources :challenges, only: :show do
    resources :messages, only: :create
  end
end
