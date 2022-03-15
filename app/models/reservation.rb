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
class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
  has_one :host, through: :listing
  enum status: {pending: 0, booked: 1, canceling: 3, cancelled: 2, expired: 4}
  has_one :calendar_event, dependent: :destroy, required: true

  delegate :start_date, to: :calendar_event
  delegate :end_date, to: :calendar_event
  delegate :nights, to: :calendar_event
end
