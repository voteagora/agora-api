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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Delegation < ApplicationRecord
end
