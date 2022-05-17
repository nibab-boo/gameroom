Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gamerooms, only: [:show, :create] do
    resources :moves, only: [:index, :create]
  end
  mount ActionCable.server => '/cable'
end