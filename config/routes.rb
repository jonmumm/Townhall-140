TownHall140::Application.routes.draw do
  root :to => "main#index"

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  post "event" => "event#create"
  get "event" => "event#index"
  get "event/current"

  resource :subscribers

  get "shows/:id/admin" => "shows#admin", :as => :show_admin
  resource :shows

end
