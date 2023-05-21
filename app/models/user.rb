# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# User represents a given address on the blockchain that holds a token
# in a DAO that we care about.
class User < ApplicationRecord

    has_many :votes, foreign_key: :address, primary_key: :address
    has_many :delegations, foreign_key: :delegator_addr, primary_key: :address
    has_many :delegations_received, foreign_key: :delegatee_addr, primary_key: :address
    has_many :proposals, foreign_key: :creator_addr, primary_key: :address
    has_many :balances, foreign_key: :address, primary_key: :address
    

    # Get the current balance of a user for a given token
    def get_current_balance(token)
        Balance.where(address: self.address, token: token).last.amount + Delegation.where(delegatee_addr: self.address, token: token).sum(:amount)
    end

    # Get the current voting power of a user for a given token
    # Balance + Delegations
    def get_current_voting_power(token)
        get_current_balance(token) + Delegation.where(delegatee_addr: self.address, token: token).sum(:amount)        
    end

    def to_builder
        Jbuilder.new do |user|
            user.(self, :address)
        end
    end

end
