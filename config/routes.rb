Rails.application.routes.draw do
	get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #post '/assignment', to: 'assignments#create'
  post '/get_groups', to: 'groups#get_groups'
  resources :users, only: [:show, :update]
  resources :assignments, only: [:create, :destroy]
end
