# frozen_string_literal: true

# Newsletter model to represent a users newsletter.
# Has the following fields -
#       t.string :name      -> The name of the newsletter.
#       t.text :information -> General information provided by the user.
#       t.text :statistics  -> Statistics such as open rate.
#       t.integer :user_id  -> User ID for the belongs_to relationship.
class Newsletter < ApplicationRecord
  belongs_to :user
  has_many :slots
end
