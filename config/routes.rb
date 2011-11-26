TownHall140::Application.routes.draw do
  root :to => "main#index"

  devise_for :users

  resources :subscribers
  resources :shows do
    resources :events
  end

end
