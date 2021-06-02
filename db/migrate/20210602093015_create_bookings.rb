class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :slot

      # info about the booker -
      t.string :booker_name
      t.string :booker_email
      t.string :booker_billing_address

      # info about the advert
      t.string :advert_title
      t.string :advert_product
      t.string :advert_url
      t.string :advert_image_url
      t.text :advert_description

      t.timestamps
    end
  end
end
