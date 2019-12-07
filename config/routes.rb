Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users do
    collection do
      get :admin_member
    end
    member do
      get :withdrawal
    end
  end
  resources :relationships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
