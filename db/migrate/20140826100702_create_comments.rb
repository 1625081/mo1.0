class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.boolean :primery
      t.belongs_to :article, index: true
      t.belongs_to :image, index: true
      t.belongs_to :video, index: true
      t.belongs_to :music, index: true
      
      t.timestamps
    end
  end
end
