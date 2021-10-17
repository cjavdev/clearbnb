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
