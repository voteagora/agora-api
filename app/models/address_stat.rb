# == Schema Information
#
# Table name: address_stats
#
#  id                       :bigint           not null, primary key
#  address                  :string
#  token                    :string
#  tokens_owned             :float
#  tokens_delegated         :float
#  tokens_partial_delegated :float
#  tokens_liquid_delegated  :float
#  total_voting_power       :float
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class AddressStat < ApplicationRecord
end
