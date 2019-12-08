Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users do
    get 'users/:name', controller: 'users', action: 'edit'
    collection do
      get :admin_member
      get :follower_list
      get :following_list
      get :matching_list
    end
    member do
      get :withdrawal
    end
  end
  resources :relationships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
