# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  listing_id :bigint           not null
#  room_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Room < ApplicationRecord
  belongs_to :listing
  has_many :beds, dependent: :destroy
  accepts_nested_attributes_for :beds

  enum room_type: {
    bedroom: 0,
    primary_bedroom: 1,
    living_room: 2,
    basement: 3,
  }
end
