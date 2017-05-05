Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :feedbacks, only: %i(new create)
  resources :article_comments, only: %i(edit update destroy), as: "comments"

  resources :articles, only: %i(show create new index edit update destroy) do
    resources :article_comments, as: "comments", path: "comments", only: %i(show new create)
  end

  get "about_us", to: "pages#about_us"

  root to: "articles#index"
end
