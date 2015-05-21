class AddSubimageToImages < ActiveRecord::Migration
  def change
    add_column :images, :subimage, :string
  end
end
