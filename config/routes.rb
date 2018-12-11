Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :places do
    resources :comments
  end

  root 'welcome#index'
end
