class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|

      # general info for the slot -
      t.integer :price_cents
      t.boolean :booked, default: false
      t.datetime :publish_date
      t.references :newsletter

      t.timestamps
    end
  end
end
