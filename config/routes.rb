HackfestProject::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"

  resources :routes do
    resources :locations do
      member do
        get :toggle
        post :name
        post :push_departures
        post :attach
      end
      resources :departures
    end
  end

  match "/location_details/:id", :to => "location_details#index"

  match "/nearby", :to => "home#nearby", :as => :nearby

end
