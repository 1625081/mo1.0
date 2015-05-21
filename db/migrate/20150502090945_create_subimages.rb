class CreateSubimages < ActiveRecord::Migration
  def change
    create_table :subimages do |t|
      t.string :file
      t.belongs_to :image ,index: true

      t.timestamps
    end
  end
end
