class AddDmvideoIdToScores < ActiveRecord::Migration
  def change
  	 add_column :scores, :dmvideo_id, :integer
  end
end
