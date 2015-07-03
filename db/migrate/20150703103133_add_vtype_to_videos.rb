class AddVtypeToVideos < ActiveRecord::Migration
  def change
  	 add_column :videos, :vtype, :string
  end
end
