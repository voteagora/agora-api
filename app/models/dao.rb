# == Schema Information
#
# Table name: daos
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  token      :string           not null
#  chain      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Dao < ApplicationRecord
end
