class CreateSlotTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :slot_types do |t|
      # generic slot information
      t.string :name
      t.text :description

      # each slot type can have it's own template
      t.string :email_template_subject
      t.text :email_template_body

      t.references :newsletter, null: false, foreign_key: true
      t.timestamps
    end
  end
end