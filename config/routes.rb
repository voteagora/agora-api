Rails.application.routes.draw do

  # Routes are handled in app/controllers/api
  namespace :api do
    namespace :v1 do
      # Users
      get "users", to: "users#index"
      get "users/:address", to: "users#show"
      get "users/search/:term", to: "users#search"
      # Proposals
      get "proposals", to: "proposals#index"
      get "proposals/:uuid", to: "proposals#show"
      get "proposals/search/:term", to: "proposals#search"
      # Votes
      get "proposals/:uuid/votes", to: "votes#by_proposal"
      get "users/:address/votes", to: "votes#by_user"
      # Delegations
      get "users/:address/delegations", to: "delegations#by_user"
      get "users/:address/delegations_received", to: "delegations#by_user_received"
      
    end
  end
  
end
