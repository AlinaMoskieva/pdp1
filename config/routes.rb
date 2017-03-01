Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles, only: %i(show create new index edit update destroy)
  resources :feedbacks, only: %i(new create)

  get "about_us", to: "pages#about_us"
  root to: "articles#index"
end
