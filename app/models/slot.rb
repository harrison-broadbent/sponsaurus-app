# frozen_string_literal: true

# Slot: Represents a sponsorship slot for a newsletter
# Fields ->
#
#       # general info for the slot -
#       t.integer :price_cents
#       t.boolean :booked
#       t.datetime :publish_date
#       t.references :newsletter
class Slot < ApplicationRecord
  monetize :price_cents

  # Associations
  belongs_to :newsletter
  belongs_to :slot_type
  default_scope -> { order(publish_date: :desc) }

  # Validations
  validates :publish_date, presence: true
  validates :price_cents, presence: true, numericality: true
  validate :validate_publish_date_in_future

  # Methods
  def validate_publish_date_in_future
    if !publish_date.nil? && (publish_date < Time.now)
      errors.add(:publish_date, 'The publish date must be in the future.')
    end
  end

  def formatted_publish_date
    publish_date.strftime('%B %e, %Y')
  end

  def days_until_published
    (publish_date.to_date - Date.today).to_i
  end

  def expired?
    (publish_date.to_date - Date.today).to_i <= 0
  end
end
