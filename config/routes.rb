Gov140::Application.routes.draw do
  root :to => "main#index"

  get "shows/new" => "shows#new", :as => :new_show
  get "shows/:id" => "shows#show", :as => :show
  post "shows" => "shows#create"

  get "auth/:provider/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout

end
