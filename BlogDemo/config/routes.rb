Rails.application.routes.draw do
	
  root 					'static_pages#home'
  get 'signup' 			=> 'users#new'
  get 'signin'			=> 'sessions#new'
  post 'signin'			=> 'sessions#create'
  delete 'signout'		=> 'sessions#destroy'
  get 'signout'		=> 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :entries,             only: [:index, :new, :create, :destroy]
end
