class AddCoverToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :cover, :string
  end
end
