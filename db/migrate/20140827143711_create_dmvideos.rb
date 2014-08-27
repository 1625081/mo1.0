class CreateDmvideos < ActiveRecord::Migration
  def change
    create_table :dmvideos do |t|
      t.string :title
      t.integer :user_id
      t.string :tudouid

      t.timestamps
    end
  end
end
