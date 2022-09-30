Rails.application.routes.draw do
  devise_for :users, path:"", controllers: {sessions: 'users/sessions'}, path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only:[:new, :create]
      resources :likes, only:[:create]
    end
  end
  root "users#index"

  namespace :api, defaults: {format: :json} do
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create ] #api/posts/:post_id/comments
    end
  end
end
