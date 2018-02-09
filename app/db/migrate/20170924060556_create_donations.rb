class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :from_id, null: false
      t.integer :to_id, null: false
      t.datetime :delivery_time
      t.string :contact_first
      t.string :contact_last
      t.string :contact_email
      t.string :contact_phone
      t.timestamps
    end
  end
end
