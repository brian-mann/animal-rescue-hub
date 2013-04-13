class CreateAnimalTypes < ActiveRecord::Migration
  def change
    create_table :animal_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
