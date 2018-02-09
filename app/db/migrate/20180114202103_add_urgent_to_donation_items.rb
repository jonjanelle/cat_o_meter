class AddUrgentToDonationItems < ActiveRecord::Migration[5.1]
  def change
    add_column :donation_items, :urgent, :boolean
  end
end
