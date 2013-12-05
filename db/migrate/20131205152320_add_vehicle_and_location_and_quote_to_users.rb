class AddVehicleAndLocationAndQuoteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vehicle, :text
    add_column :users, :location, :text
    add_column :users, :quote, :integer
  end
end
