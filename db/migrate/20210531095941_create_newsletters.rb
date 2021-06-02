class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.string :name
      t.text :information
      t.text :statistics
      t.references :user

      t.timestamps
    end
  end
end
