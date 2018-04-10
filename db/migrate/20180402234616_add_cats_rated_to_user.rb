class AddCatsRatedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cats_rated, :integer, array: true, default: []
    add_column :users, :profile_name, :string, default: nil
  end
end
