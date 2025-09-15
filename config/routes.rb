Rails.application.routes.draw do
  root "home#index"

  resources :posts do
    resource :like, only: %i[show create destroy]
  end

  resource :profile, only: %i[new create show update]

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  devise_for :users
end
