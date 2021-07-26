# == Schema Information
#
# Table name: newsletters
#
#  id          :bigint           not null, primary key
#  information :text
#  name        :string
#  slug        :string
#  statistics  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_newsletters_on_slug     (slug) UNIQUE
#  index_newsletters_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Newsletter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
