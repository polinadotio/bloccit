Rails.application.routes.draw do
  
  get 'comments/create'

  devise_for :users
  resources :users, only: [:update]

  resources :topics do 
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  get 'about' => 'welcome#about'
 
  root to: 'welcome#index'

end
