class AddKeysToImages < ActiveRecord::Migration
  def change
    add_column :images, :keys, :string,array: true,default: '{}'
  end
end
