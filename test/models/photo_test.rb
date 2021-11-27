# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  listing_id :bigint           not null
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
