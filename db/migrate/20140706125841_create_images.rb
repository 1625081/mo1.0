class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.boolean :public, defailt: false
      t.string :title, default: ""
      t.text :description, defailt: ""

      t.timestamps
    end
  end
end
