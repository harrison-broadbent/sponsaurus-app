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
require 'rails_helper'

RSpec.describe SlotType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
