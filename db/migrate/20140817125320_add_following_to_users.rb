class AddFollowingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :following, :integer, array: true
  end
end
