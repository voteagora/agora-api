Rails.application.routes.draw do
  resources :address_stats
  resources :events

  # Routes are handled in app/controllers/api
  namespace :api do
    namespace :v1 do
      # Users
      get "users", to: "users#index"
      get "users/:address", to: "users#show"
      get "users/search/:term", to: "users#search"
      get "users/:address/votes", to: "users#votes"
      # Proposals
      get "proposals", to: "proposals#index"
      get "proposals/:uuid", to: "proposals#show"
      get "proposals/search/:term", to: "proposals#search"
      get "proposals/:uuid/votes", to: "proposals#votes"
      # Delegations
      get "users/:address/delegations", to: "delegations#by_user"
      get "users/:address/delegations_received", to: "delegations#by_user_received"
      scope ":token" do
        get "delegates", to: "delegates#delegates_by_token"
        get "delegates/:address", to: "delegates#show"
      end
    end
  end
end
