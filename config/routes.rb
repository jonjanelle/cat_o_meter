Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :cats do
    collection do
      get :edit_profiles
    end
  end
end
