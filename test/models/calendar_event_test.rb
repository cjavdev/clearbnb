# == Schema Information
#
# Table name: calendar_events
#
#  id             :bigint           not null, primary key
#  listing_id     :bigint           not null
#  reservation_id :bigint
#  status         :integer          not null
#  start_date     :date             not null
#  end_date       :date             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class CalendarEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
