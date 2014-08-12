class AddFollowerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :follower, :integer, array: true
  end
end
