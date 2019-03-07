class AddBreweryAndAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :taproom_id, :integer
  end
end
