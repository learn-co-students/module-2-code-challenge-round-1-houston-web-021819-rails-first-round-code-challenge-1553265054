Rails.application.routes.draw do
  resources :powers
  resources :heroines do
    #add search routes
    collection do 
      get :search, :action => 'search_power', :as => 'search_power'
      get 'search/:q', :action => 'search', :as => 'search'
    end
  end


end
