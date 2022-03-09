# == Schema Information
#
# Table name: reservations
#
#  id                       :bigint           not null, primary key
#  listing_id               :bigint           not null
#  guest_id                 :bigint           not null
#  session_id               :string
#  status                   :integer          default("pending")
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  stripe_payment_intent_id :string
#  stripe_refund_id         :string
#
require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
