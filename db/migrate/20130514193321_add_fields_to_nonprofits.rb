class AddFieldsToNonprofits < ActiveRecord::Migration
  def change
    add_column :nonprofits, :avatar, :string
    add_column :nonprofits, :bio, :text
    add_column :nonprofits, :date_est, :date
  end
end
