Showjo::Application.routes.draw do

  root :to => 'main#index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end
