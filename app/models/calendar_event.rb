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
class CalendarEvent < ApplicationRecord
  belongs_to :listing
  belongs_to :reservation, optional: true
  validates :status, presence: true
  enum status: { reserved: 0, blocked: 1 } # blocked means manually held by the host

  validates :start_date, presence: true
  validates :end_date, presence: true
  # Start date cannot fall after end date
  validates :start_date, comparison: { less_than: :end_date }
  # Dates must be in the future
  validates :start_date, inclusion: {
    in: (Date.today..Date.today + 365 + 365),
    message: "must be in the future"
  }
  # Dates don't overlap with other calendar events for this listing
  validates :start_date, :end_date, overlap: {
    exclude_edges: ['start_date', 'end_date'],
    scope: :listing_id,
    message_content: 'is already booked for this date range'
  }

  def nights
    (start_date...end_date).count
  end
end
