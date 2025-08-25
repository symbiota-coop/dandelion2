Rails.application.routes.draw do
  # Read-only routes for events
  resources :events, only: [:index, :show]

  root "events#index"
end
