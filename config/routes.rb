TownHall140::Application.routes.draw do
  post "event" => "event#create"
  get "event" => "event#index"
  get "event/current"

  root :to => "main#splash"

  get "shows" => "main#index"

  get "shows/new" => "shows#new", :as => :new_show
  get "shows/:id/admin" => "shows#admin", :as => :show_admin
  get "shows/:id" => "shows#show", :as => :show
  post "shows" => "shows#create"

  get "auth/:provider/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout

end
