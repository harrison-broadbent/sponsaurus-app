class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.string :name
      t.text :information
      t.text :statistics
      t.integer :user_id

      t.timestamps
    end
  end
end
