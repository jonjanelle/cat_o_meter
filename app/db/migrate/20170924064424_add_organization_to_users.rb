class AddOrganizationToUsers < ActiveRecord::Migration[5.1]
  def change
    # Is the account for an organization? Enables account to make DonationRequests.
    add_column :users, :organization, :boolean, default: false
  end
end
