HackfestProject::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"

  resources :routes do
    resources :locations do
      member do
        get :toggle
        post :name
      end
    end
  end

  match "/nearby", :to => "home#nearby", :as => :nearby

end
