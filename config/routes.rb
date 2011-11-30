TownHall140::Application.routes.draw do
  ActiveAdmin.routes(self)

  root :to => "main#index"

  devise_for :users, :controllers => { :registrations => "registrations" }
  match "/auth/:provider/callback" => "authentications#create"

  resources :authentications
  resources :subscribers
  resources :shows do
    resources :chats
    resources :events
  end

end
