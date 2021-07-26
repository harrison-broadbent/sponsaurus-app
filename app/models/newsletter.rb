# frozen_string_literal: true

# Newsletter model to represent a users newsletter.
# Has the following fields -
#       t.string :name      -> The name of the newsletter.
#       t.text :information -> General information provided by the user.
#       t.text :statistics  -> Statistics such as open rate.
#       t.integer :user_id  -> User ID for the belongs_to relationship.
class Newsletter < ApplicationRecord
  # before_create :set_default_email_content

  # Pretty URL Slugs
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations
  belongs_to :user
  has_many :slots, dependent: :destroy
  has_many :slot_types

  # Validations

  validates :name, presence: true
  validates :information, presence: true
  validates :statistics, presence: true

  # Methods
  #   def set_default_email_content
  #     self.email_template_subject = "#{self.name} sponsorship enquiry"
  #     self.email_template_body = "Hey, I'm getting in touch to book a sponsorship slot in your newsletter.
  # Here are the relevant details:
  # Ad Details -
  # Name: [Insert Product Name]
  # Tagline: [Insert Product Tagline]
  # Body: [Insert Body Text]
  # Link: [Insert link to Product]
  # Image: [Add an image (optional)]
  #
  # My Details -
  # Name: [Name of contact reference]
  # Email: [Email of contact reference]
  # Role: [Your role and relationship to the product]
  # [NOTE TO SENDER: Please fill in ALL the following to ensure your inquiry is taken seriously.]
  # [Feel free to delete the text in [brackets] before sending]
  # "
  #   end
end
