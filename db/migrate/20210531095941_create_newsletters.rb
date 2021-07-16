class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.string :name
      t.text :information
      t.text :statistics
      t.string :email_template_subject
      t.text :email_template_body
      t.references :user

      t.timestamps
    end
  end
end
