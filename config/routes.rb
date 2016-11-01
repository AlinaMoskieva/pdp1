Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles, only: %i(show create new index edit update destroy)
  resources :feedbacks, only: %i(new create)
  resources :comments, only: %i(update destroy show)

  resources :articles do
    resources :comments, shallow: true
  end

  get "about_us", to: "pages#about_us"

  root to: "articles#index"
end
