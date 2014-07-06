class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.float :score, default: 0.0
      t.string :file
      t.integer :like, array: true
      t.integer :favorate, array: true
      t.boolean :public, defailt: false
      t.string :title, default: ""
      t.text :description, defailt: ""

      t.timestamps
    end
  end
end
