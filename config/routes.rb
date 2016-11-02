Rails.application.routes.draw do
  resources :articles, only: %i(show create new index edit update destroy)
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "articles#index"
end
