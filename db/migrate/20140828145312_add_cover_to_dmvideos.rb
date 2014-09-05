class AddCoverToDmvideos < ActiveRecord::Migration
  def change
    add_column :dmvideos, :cover, :string
  end
end
