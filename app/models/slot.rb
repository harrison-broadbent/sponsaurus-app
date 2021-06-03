# frozen_string_literal: true

# Slot: Represents a booking slot for a newsletter
# Fields ->
#
#       # general info for the slot -
#       t.integer :price_cents
#       t.boolean :booked
#       t.datetime :publish_date
#       t.references :newsletter
class Slot < ApplicationRecord
  # Associations
  belongs_to :newsletter
  has_one :booking, dependent: :destroy
  default_scope -> { order(publish_date: :asc) }

  # Validations
  validates :publish_date, presence: true
  validates :price_cents, presence: true, numericality: true

  validate :publish_date_in_the_future

  # Methods
  def publish_date_in_the_future
    unless publish_date.nil?
      errors.add(:publish_date, 'The publish date must be in the future.') if publish_date < Time.now
    end
  end

  def formatted_date
    publish_date.strftime('%B %e, %Y')
  end

  def booked?
    !booking.nil?
  end
end
