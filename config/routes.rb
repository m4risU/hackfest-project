HackfestProject::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"

  resources :routes do
    resources :locations
  end

end
