class CreateRating < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true, null: false
      t.references :cat, foreign_key: true, null: false
      t.integer :rating, null: false
    end
  end
end
