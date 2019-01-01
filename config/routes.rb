Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get 'welcome/index'
  
  resources :places do
    resources :comments
  end

  root 'welcome#index'
end
