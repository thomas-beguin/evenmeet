Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/events/:id", to: "events#show"
  resources :events do
    resources :participations, only: %i[new create]
  end

end
