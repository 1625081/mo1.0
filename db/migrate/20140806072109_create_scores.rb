class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.float :score, default: 0.0
      t.integer :liker, array: true
      t.integer :favor, array: true
      t.integer :viewer
      t.integer :editor_rec, array:true
      t.belongs_to :image

      t.timestamps
    end
  end
end
