# frozen_string_literal: true

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

class Newsletter < ApplicationRecord
  # before_create :set_default_email_content

  # Pretty URL Slugs
  extend FriendlyId
  friendly_id :name, use: %i[slugged]

  # Associations
  belongs_to :user
  has_many :slots, dependent: :destroy
  has_many :slot_types, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { in: 2..40 }
  validates :information, presence: true, length: { in: 2..300 }
  validates :statistics, presence: true, length: { in: 2..100 }

end
