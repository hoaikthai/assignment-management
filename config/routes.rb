Rails.application.routes.draw do
	get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/get_assignments', to: 'assignments#get_assignments'
  post '/get_groups', to: 'groups#get_groups'
  resources :users, only: [:show, :update]
  resources :assignments, only: [:create, :destroy]
  resources :submissions, only: [:create]
end
