class AddExifToImages < ActiveRecord::Migration
  def change
  	add_column :images, :exif, :hstore
  end
end
