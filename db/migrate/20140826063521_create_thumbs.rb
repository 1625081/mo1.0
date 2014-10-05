class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.string :file
      t.belongs_to :music, index: true
      t.belongs_to :video, index: true
      t.belongs_to :dmvideo, index: true

      t.timestamps
    end
  end
end
