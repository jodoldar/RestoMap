Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get 'welcome/index'
  
  resources :places do
    resources :comments
  end
  resources :users

  root 'welcome#index'
end
