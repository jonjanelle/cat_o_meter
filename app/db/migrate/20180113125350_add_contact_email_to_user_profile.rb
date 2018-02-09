class AddContactEmailToUserProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :contact_email, :string, default: nil
  end
end
