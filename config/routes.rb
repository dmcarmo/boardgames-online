Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  resources :sites, only: [:index, :show, :new, :create, :destroy]
  get '/sites/:id/updategames', to: 'sites#update_games', as: 'update_games'
end
