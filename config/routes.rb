Rails.application.routes.draw do
  resources :ens_records
  resources :proposal_stats
  resources :votes
  resources :proposals
  resources :delegations
  resources :balances
  resources :users
  resources :daos
end
