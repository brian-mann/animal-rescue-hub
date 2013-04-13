class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :donor_id
      t.integer :animal_id
      t.integer :amount

      t.timestamps
    end
  end
end
