Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[create show update]
  # devise_for :users

  resources :projects

  resources :sessions, only: %i[create destroy]

  get '/proj_by_name/:name', to: 'projects#proj_by_name'
end
