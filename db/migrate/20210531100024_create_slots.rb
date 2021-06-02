class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|

      # consider breaking out into 3 separate models -
      #   - Slot
      #   - Booker
      #   - Advert

      # general info for the slot -
      t.integer :price_cents
      t.boolean :booked, default: false
      t.datetime :publish_date
      t.references :newsletter

      # info about the booker -
      t.string :booker_name
      t.string :booker_email
      t.string :booker_billing_address

      # info contained in a booked slot -
      t.string :advert_title
      t.string :advert_product
      t.string :advert_url
      t.string :advert_image_url
      t.text :advert_description

      t.timestamps
    end
  end
end
