class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.boolean :public, default: false
      t.string :title, default: ""
      t.text :description, default: ""
      t.integer :user_id
      t.boolean :persional, default: true

      t.timestamps
    end
  end
end
