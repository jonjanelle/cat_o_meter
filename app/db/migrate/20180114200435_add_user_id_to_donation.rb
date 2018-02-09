class AddUserIdToDonation < ActiveRecord::Migration[5.1]
  def change
    add_reference :donations, :user, foreign_key: true
    add_reference :donations, :donation_request, foreign_key: true
    remove_column :donations, :from_id
    remove_column :donations, :to_id
  end
end
