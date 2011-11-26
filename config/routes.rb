TownHall140::Application.routes.draw do
  get "test/index"

  root :to => "main#index"
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  post "event" => "event#create"
  get "event" => "event#index"
  get "event/current"

  resource :subscribers

  get "shows/new" => "shows#new", :as => :new_show
  get "shows/:id/admin" => "shows#admin", :as => :show_admin
  resource :shows
  get "shows/:id" => "shows#show", :as => :show
  post "shows" => "shows#create"

  get "auth/:provider/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout

end
