HAPPyHOURr::Application.routes.draw do

  #get "users/new"

  get "search/", to: 'search#index', as: 'search'

  #get "home/index"

  root to: "home#index"

  resources :bars
  resources :users

  #resources :home, :only => [:show]
 # get 'home', to: 'home#show'
  #root :to => redirect('/home/index')
#  resources :bars do
#    resources :time
#  end
  get '/bars/:id', to: 'bars#show', as:'bar'

  resources :sessions, only: [:new, :create, :destroy]
  match 'signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  
  match '/home', to: 'home#index', via: 'get'
#  get '/users/:id', to: 'users#show' as:'user'
#  resources :search
#  resources :profiles, controller: 'users'
  get '/users/:id', to: 'users#show', as:'user'

  resources :bars do
    member { post :rate}
  end
end
