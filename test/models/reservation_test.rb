# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  listing_id :bigint           not null
#  guest_id   :bigint           not null
#  session_id :string
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
