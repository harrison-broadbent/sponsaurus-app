# frozen_string_literal: true

class Booking < ApplicationRecord
  # Associations
  belongs_to :slot

  # Validations
  # >Validations for the booker
  validates :booker_name, presence: true
  validates :booker_email, presence: true
  validates :booker_billing_address, presence: true

  # >Validations for the advert
  validates :advert_title, presence: true
  validates :advert_url, presence: true
  validates :advert_description, presence: true
  validates :advert_product, presence: true
  
  # Methods
end
