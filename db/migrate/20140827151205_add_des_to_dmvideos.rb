class AddDesToDmvideos < ActiveRecord::Migration
  def change
  	add_column :dmvideos, :des, :text
  end
end
