Rails.application.routes.draw do
  root "home#index"

  resource :profile, only: %i[new create show edit update]

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  devise_for :users
end
