class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.boolean :gender
      t.datetime :goal_date
      t.integer :goal_amount
      t.text :story
      t.integer :nonprofit_id
      t.integer :donation_id
      t.integer :type_id
      t.integer :need_level_id

      t.timestamps
    end
  end
end
