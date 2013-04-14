class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :avatar
      t.string :city
      t.integer :state_id
      t.string :zip
      t.integer :age
      t.boolean :gender
      t.datetime :goal_date
      t.integer :goal_amount
      t.integer :goal_progress
      t.text :story
      t.integer :nonprofit_id
      t.integer :donation_id
      t.integer :animal_type_id
      t.integer :need_level_id
			t.integer :photo_id
			t.string :progress

      t.timestamps
    end
  end
end
