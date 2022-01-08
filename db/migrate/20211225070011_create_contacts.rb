class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :genre_id, null: false
      t.text :memo, null: false

      t.timestamps
    end
  end
end
