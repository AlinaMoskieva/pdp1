Rails.application.routes.draw do
  resources :articles
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "articles#index"
end
