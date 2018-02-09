class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :cat, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :rating, null: false
    end
  end
end
