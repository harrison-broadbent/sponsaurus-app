# frozen_string_literal: true

# Slot: Represents a booking slot for a newsletter
# Fields ->
#
#       # general info for the slot -
#       t.integer :price_cents
#       t.boolean :booked
#       t.datetime :publish_date
#       t.references :newsletter
#
#       # info about the booker -
#       t.string :booker_name
#       t.string :booker_email
#       t.string :booker_billing_address
#
#       # info contained in a booked slot -
#       t.string :advert_title
#       t.string :advert_product
#       t.string :advert_url
#       t.string :advert_image_url
#       t.text :advert_description
class Slot < ApplicationRecord

  # Associations
  belongs_to :newsletter
  has_one :booking
  default_scope -> { order(publish_date: :desc) }

  # Validations

  # Methods
  def formatted_date
    publish_date.strftime('%B %e, %Y')
  end

  def booked?
    !booking.nil?
  end
end
