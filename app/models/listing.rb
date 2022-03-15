# == Schema Information
#
# Table name: listings
#
#  id                :bigint           not null, primary key
#  host_id           :bigint           not null
#  title             :string           not null
#  about             :text
#  max_guests        :integer          default(1)
#  address_line1     :string
#  address_line2     :string
#  city              :string
#  state             :string
#  postal_code       :string
#  country           :string
#  lat               :decimal(10, 6)
#  lng               :decimal(10, 6)
#  status            :integer          default("draft")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  nightly_price     :integer
#  cleaning_fee      :integer
#  stripe_product_id :string
#
class Listing < ApplicationRecord
  validates :nightly_price, numericality: { greater_than: 0 }
  validates :cleaning_fee, numericality: { greater_than: 0 }

  validates :title, presence: true
  validates :max_guests, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  belongs_to :host, class_name: 'User'
  enum status: {draft: 0, published: 1, archived: 2}
  has_many :rooms
  has_many :photos
  has_many :calendar_events
  has_many :reservations
  scope :published, -> { where(status: :published) }

  after_commit :maybe_create_stripe_product, on: [:create, :update]

  def maybe_create_stripe_product
    return if !stripe_product_id.blank?

    product = Stripe::Product.create(
      name: title,
      url: Rails.application.routes.url_helpers.url_for(self),
      metadata: {
        clearbnb_id: id,
      }
    )
    update(stripe_product_id: product.id)
  end

  def address
    "#{address_line1} #{address_line2} #{city} #{state}"
  end
end
