Rails.application.routes.draw do
  # Read-only routes for events
  resources :events, only: [:index, :show], param: :slug
  
  # Read-only routes for organisations
  resources :organisations, only: [:index, :show], param: :slug

  resources :configurations, only: [] do
    get :ios_v1, on: :collection
    get :android_v1, on: :collection
  end

  root "events#index"
end
