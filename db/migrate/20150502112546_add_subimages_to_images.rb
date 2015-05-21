class AddSubimagesToImages < ActiveRecord::Migration
  def change
    add_column :images, :subimages, :string, array: true, default: '{}'
  end
end
