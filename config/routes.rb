Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gamerooms, only: [:show, :create, :destroy] do
    resources :moves, only: [:index, :create]
  end
  mount ActionCable.server => '/cable'

  get '/gamerooms/:id/reset', to: "gamerooms#reset"
end
