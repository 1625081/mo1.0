class AddPkuIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pku_id, :string
  end
end
