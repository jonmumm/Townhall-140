TownHall140::Application.routes.draw do

  resource :shows
  match "shows/:id/admin" => "shows#admin", :as => :show_admin
  
  post "event" => "event#create"
  get "event" => "event#index"
  get "event/current"

  root :to => redirect("/shows/20")

  get "auth/:provider/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout

end
