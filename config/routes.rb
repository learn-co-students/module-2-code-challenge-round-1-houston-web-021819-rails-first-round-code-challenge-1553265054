Rails.application.routes.draw do
  resources :powers, only: [:index, :show]

  get '/search', to: 'heroines#search'
  resources :heroines, only: [:new, :create, :index, :show]

end
