Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[create show update]
  # devise_for :users

  resources :projects

  resources :sessions, only: %i[create destroy]

  # Returns the project with an associated name
  get '/proj_by_name/:name', to: 'projects#proj_by_name'

  # Returns a user with an associated email
  get '/user_by_email/', to: 'users#user_by_email'

  get '/query/', to: 'projects#query'
end
