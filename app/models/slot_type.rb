# == Schema Information
#
# Table name: slot_types
#
#  id                     :bigint           not null, primary key
#  description            :text
#  email_template_body    :text
#  email_template_subject :string
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  newsletter_id          :bigint           not null
#
# Indexes
#
#  index_slot_types_on_newsletter_id  (newsletter_id)
#
# Foreign Keys
#
#  fk_rails_...  (newsletter_id => newsletters.id)
#
class SlotType < ApplicationRecord
  before_validation :set_default_email_content, on: :create

  # associations
  belongs_to :newsletter
  has_many :slots

  # validation

  validates :name, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: { in: 2..300 }
  validates :email_template_subject, presence: true
  validates :email_template_body, presence: true

  # methods
  def set_default_email_content
    self.email_template_subject ||= "#{self.newsletter.name} Sponsorship"
    self.email_template_body ||= "Hey, I'd like to book a sponsorship slot in your newsletter.
Here are the relevant details:
Ad Details -
Name: [Insert Product Name]
Tagline: [Insert Product Tagline]
Body: [Insert Body Text]
Link: [Insert link to Product]
Image: [Add an image (optional)]

My Details -
Name: [Name of contact reference]
Email: [Email of contact reference]
Role: [Your role and relationship to the product]

[NOTE TO SENDER: Please fill in ALL the following to ensure your inquiry is taken seriously.]
[Feel free to delete the remaining text in [brackets] before sending]

Booking via Sponsaurus.
"

  end
end
