Stocktracker::Application.routes.draw do
  root 'stocks#index'

  resources :stocks
end
