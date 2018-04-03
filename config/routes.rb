Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :cats, except: :index do
    collection do
      post :create_rating
    end
  end
end
