# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  kind       :string
#  token      :string
#  address    :string
#  event_data :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
end
