Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



  devise_for :users

  get "users/:id", to "user_events#show",
  post "users/:id", to "user_events#show",

  get "users/:id", to "challenges#show"

end
