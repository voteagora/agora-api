# == Schema Information
#
# Table name: delegations
#
#  id             :bigint           not null, primary key
#  delegator_addr :string           not null
#  delegatee_addr :string           not null
#  token          :string           not null
#  amount         :float            not null
#  status         :string
#  kind           :string           default("token")
#  permissions    :jsonb
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Delegation < ApplicationRecord

    belongs_to :delegator, class_name: "User", foreign_key: :delegator_addr, primary_key: :address
    belongs_to :delegatee, class_name: "User", foreign_key: :delegatee_addr, primary_key: :address

    after_create :create_delegation_event

    private

    def create_delegation_event
        event = Event.new
        event.token = self.token
        event.address = self.delegator_addr
        event.event_data = self.as_json
        case self.kind
        when "token"
            event.kind = "delegation_token"
        when "liquid"
            event.kind = "delegation_liquid"
        end
        event.save
    end


end
