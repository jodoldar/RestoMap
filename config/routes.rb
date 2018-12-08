Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :places

  root 'welcome#index'
end
