class AddDesToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :des, :text
  end
end
