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
#
require 'rails_helper'

RSpec.describe Slot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
