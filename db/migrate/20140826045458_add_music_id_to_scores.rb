class AddMusicIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :music_id, :integer
  end
end
