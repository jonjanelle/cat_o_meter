class DonationItems < ActiveRecord::Migration[5.1]
  def change
    create_table :donation_items do |t|
      #Donation items can belong to Donations or DonationRequests
      t.string :resource_type, null: false
      t.integer :resource_id, null: false
      t.string :name, null: false
      t.string :category, default: nil
      t.string :description, default: nil
      t.integer :quantity, default: nil
      t.date :start_availability, default: nil
      t.date :end_availability, default: nil
      #Whether a DonationRequest would be willing to accept a quantity greater than the DonationItem quantity
      t.boolean :accept_more, default: false
      t.timestamps
    end
  end
end
