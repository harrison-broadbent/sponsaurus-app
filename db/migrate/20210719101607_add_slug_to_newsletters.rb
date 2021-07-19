class AddSlugToNewsletters < ActiveRecord::Migration[6.1]
  def change
    add_column :newsletters, :slug, :string
    add_index :newsletters, :slug, unique: true
  end
end
