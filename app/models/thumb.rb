class Thumb < ActiveRecord::Base
  mount_uploader :file, ThumbUploader
  belongs_to :music
  belongs_to :video
  belongs_to :dmvideo
end
