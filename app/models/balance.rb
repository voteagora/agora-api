# == Schema Information
#
# Table name: balances
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  token      :string           not null
#  amount     :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Balance < ApplicationRecord

    has_one :address_stat, foreign_key: :address, primary_key: :address

end
