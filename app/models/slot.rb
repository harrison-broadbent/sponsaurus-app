# frozen_string_literal: true

# == Schema Information
#
# Table name: slots
#
#  id            :bigint           not null, primary key
#  booked        :boolean          default(FALSE)
#  price_cents   :integer
#  publish_date  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  newsletter_id :bigint
#  slot_type_id  :bigint           not null
#
# Indexes
#
#  index_slots_on_newsletter_id  (newsletter_id)
#  index_slots_on_slot_type_id   (slot_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (slot_type_id => slot_types.id)

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
