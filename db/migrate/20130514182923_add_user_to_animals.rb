class AddUserToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :user_id, :integer
  end
  # add_index :animals, [:user_id, :created_at]
end