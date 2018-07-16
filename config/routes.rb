Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :conversations, only: [:index, :create] do
  	resources :messages, only: [:index, :create]
  end
  mount ActionCable.server => '/cable'
end
