class CreateNonprofits < ActiveRecord::Migration
  def change
    create_table :nonprofits do |t|
      t.string :name
			t.string :address
      t.string :city
      t.string :state
      t.string :zip
			t.string :ein

      t.timestamps
    end
  end
end
