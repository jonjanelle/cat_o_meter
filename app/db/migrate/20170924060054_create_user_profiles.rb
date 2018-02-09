class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true, null: false
      t.string :display_name
      t.string :gender
      t.string :city
      t.string :state
      t.string :address
      t.string :address2
      t.string :zip
      t.string :phone
      t.string :bio
      t.integer :user_id
      t.date :birthdate
      t.timestamps
    end
  end
end
