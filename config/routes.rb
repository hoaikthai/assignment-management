Rails.application.routes.draw do
	get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/get_assignments', to: 'assignments#get_assignments'
  post '/get_groups', to: 'groups#get_groups'
  post '/get_submissions', to: 'submissions#get_submissions'
  resources :users, only: [:show, :update]
  resources :assignments, only: [:create, :destroy]
  resources :submissions, only: [:create, :destroy]
end
