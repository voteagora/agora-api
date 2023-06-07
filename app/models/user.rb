# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    has_many :votes, foreign_key: :address, primary_key: :address
    has_many :delegations, foreign_key: :delegator_addr, primary_key: :address
    has_many :delegations_received, foreign_key: :delegatee_addr, primary_key: :address
    has_many :proposals, foreign_key: :creator_addr, primary_key: :address
    has_many :balances, foreign_key: :address, primary_key: :address
    

    # Get the current balance of a user for a given token
    def get_current_balance(token)
        amount = 0.0
        balance = Balance.where(address: self.address, token: token).last
        if balance
            amount = balance.amount.to_f
        end
        amount
    end

    def get_delegated_balance(token)
        amount = 0.0
        delegations = Delegation.where(delegatee_addr: self.address, token: token)
        if delegations.count > 0
            amount = delegations.sum(:amount).to_f
        end
        amount
    end

    def get_partial_delegated_balance(token)
        amount = 0.0
        delegations = Delegation.where(delegatee_addr: self.address, token: token, kind: "partial")
        if delegations.count > 0
            amount = delegations.sum(:amount).to_f
        end
        amount
    end

    def get_liquid_delegated_balance(token)
        amount = 0.0
        delegations = Delegation.where(delegatee_addr: self.address, token: token, kind: "liquid")
        if delegations.count > 0
            amount = delegations.sum(:amount).to_f
        end
        amount
    end

    # Get the current voting power of a user for a given token
    # Balance + Delegations
    def get_current_voting_power(token)
        self.get_current_balance(token) + self.get_delegated_balance(token)
    end

    def to_builder
        Jbuilder.new do |user|
            user.(self, :address)
        end
    end

end
