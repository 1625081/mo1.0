class AddViewerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :viewer, :integer
  end
end
