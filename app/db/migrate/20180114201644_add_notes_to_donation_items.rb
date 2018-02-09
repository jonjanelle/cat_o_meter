class AddNotesToDonationItems < ActiveRecord::Migration[5.1]
  def change
    add_column :donation_items, :notes, :string
  end
end
