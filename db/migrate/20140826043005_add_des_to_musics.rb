class AddDesToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :des, :text
  end
end
