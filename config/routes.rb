Rails.application.routes.draw do

  # Routes are handled in app/controllers/api
  namespace :api do
    namespace :v1 do
      # Users
      get "users", to: "users#index"
      get "users/:address", to: "users#show"
      # Proposals
      get "proposals", to: "proposals#index"
      get "proposals/:uuid", to: "proposals#show"
    end
  end
  
end
