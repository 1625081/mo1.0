class AddDesToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :des, :text
  end
end
