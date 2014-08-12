class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
