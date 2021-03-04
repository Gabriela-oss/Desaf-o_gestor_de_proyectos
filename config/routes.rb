Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'projects#index'
  get 'projects/new', to: 'projects#new'
  post 'projects', to: 'projects#create'
  delete 'projects/:id', to: 'projects#destroy', as: 'destroy_project' 
  root 'projects#index'
end
