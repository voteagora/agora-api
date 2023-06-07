# == Schema Information
#
# Table name: address_stats
#
#  id                       :bigint           not null, primary key
#  address                  :string
#  token                    :string
#  tokens_owned             :float            default(0.0)
#  tokens_delegated         :float            default(0.0)
#  tokens_partial_delegated :float            default(0.0)
#  tokens_liquid_delegated  :float            default(0.0)
#  total_voting_power       :float            default(0.0)
#  number_of_delegators     :bigint           default(0)
#  number_of_delegatees     :bigint           default(0)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require 'rails_helper'

RSpec.describe AddressStat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
