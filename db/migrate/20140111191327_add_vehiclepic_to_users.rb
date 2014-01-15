class AddVehiclepicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vehiclepic, :string
  end
end
