class AddContactPhoneToUserProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :contact_phone, :string, default: nil
  end
end
