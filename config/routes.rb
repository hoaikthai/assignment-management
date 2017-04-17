Rails.application.routes.draw do
	get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/assignment', to: 'assignments#create'
  resources :users, only: [:show, :update]
end
