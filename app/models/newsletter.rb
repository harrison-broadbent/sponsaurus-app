# frozen_string_literal: true

# Newsletter model to represent a users newsletter.
# Has the following fields -
#       t.string :name      -> The name of the newsletter.
#       t.text :information -> General information provided by the user.
#       t.text :statistics  -> Statistics such as open rate.
#       t.integer :user_id  -> User ID for the belongs_to relationship.
class Newsletter < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :slots, dependent: :destroy

  # Validations

  validates :name, presence: true
  validates :information, presence: true
  validates :statistics, presence: true

  # Methods
end
