Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :event, only: %i[show] do
    resources :relationships, only: %i[new create]
  end
end
