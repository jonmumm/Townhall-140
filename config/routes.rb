TownHall140::Application.routes.draw do
  resources :questions

  ActiveAdmin.routes(self)

  root :to => "main#index"

  devise_for :users, :controllers => { :registrations => "registrations" }
  match "/auth/:provider/callback" => "authentications#create"

  get "/shows/:show_id/questions/:user_id/latest" => "questions#latest"

  resources :authentications
  resources :subscribers
  resources :shows do
    resources :chats
    resources :events
    resources :questions
  end

end
