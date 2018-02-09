class DonationRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :donation_requests do |t|
      t.integer :user_id, index: true, null: false
      t.string :description
      t.string :notes
      t.string :contact_first
      t.string :contact_last
      t.string :contact_email
      t.string :contact_phone
      t.timestamps
    end
  end
end
