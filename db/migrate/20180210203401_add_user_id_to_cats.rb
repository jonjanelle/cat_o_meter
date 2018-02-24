class AddUserIdToCats < ActiveRecord::Migration[5.1]
  def change
    add_reference :cats, :user, foreign_key: true
  end
end
