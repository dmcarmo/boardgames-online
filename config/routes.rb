Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  get '/sites', to: 'sites#index'
  get '/sites/:id', to: 'sites#show', as: 'site'
  get '/sites/:id/updategames', to: 'sites#update_games', as: 'update_games'
end
