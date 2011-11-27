TownHall140::Application.routes.draw do

  root :to => "main#index"

  devise_for :users
  match "/auth/:provider/callback" => "authentications#create"

  resources :authentications
  resources :subscribers
  resources :shows do
    resources :events
  end

end
