# == Schema Information
#
# Table name: proposals
#
#  id            :bigint           not null, primary key
#  uuid          :string           not null
#  proposer_addr :string           not null
#  token         :string           not null
#  targets       :text
#  values        :text
#  signatures    :text
#  calldata      :text
#  start_block   :bigint
#  end_block     :bigint
#  description   :text
#  kind          :string           default("agora_standard")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Proposal < ApplicationRecord

    
    # == Relationships ========================================================
    
    has_many :votes, foreign_key: :proposal_uuid, primary_key: :uuid
    has_many :voters, through: :votes, source: :user, foreign_key: :address, primary_key: :address
    
    # == Scopes ===============================================================
    
    scope :agora_standard, -> { where(kind: 'agora_standard') }
    scope :agora_offchain, -> { where(kind: 'agora_offchain') }

    scope :for_dao, -> (dao) { where(token: dao.token) }

end
