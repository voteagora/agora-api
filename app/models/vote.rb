# == Schema Information
#
# Table name: votes
#
#  id            :bigint           not null, primary key
#  address       :string           not null
#  proposal_uuid :string           not null
#  token         :string           not null
#  support       :integer          not null
#  amount        :float            not null
#  reason        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Vote < ApplicationRecord
    
    # == Relationships ========================================================
    belongs_to :proposal, foreign_key: :proposal_uuid, primary_key: :uuid
    belongs_to :user, foreign_key: :address, primary_key: :address
    
    # == Validations ==========================================================
    validates :address, presence: true
    validates :proposal_uuid, presence: true
    validates :token, presence: true
    validates :support, presence: true
    validates :amount, presence: true

    after_create :create_vote_event

    private

    def create_vote_event
        event = Event.new
        event.token = self.token
        event.address = self.address
        event.event_data = self.as_json
        event.kind = "vote"
        event.save
    end
    

end
