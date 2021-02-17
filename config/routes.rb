Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/about',  to: 'static_pages#about'
  get    '/help',   to: 'static_pages#help'

  resources :users
  get    '/signup', to: 'users#new'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post   '/tasks',   to: 'tasks#create'
  put    '/tasks',   to: 'tasks#update'
  delete '/tasks',   to: 'tasks#destroy'
end
