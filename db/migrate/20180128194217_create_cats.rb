class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.string :age
      t.string :breed
      t.string :bio
      t.string :image, null: false
    end
  end
end
