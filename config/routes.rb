Rails.application.routes.draw do
  resources :powers
  resources :heroines
  get'/heroines', to: 'heroines#index', as: 'superheroines'
end 
