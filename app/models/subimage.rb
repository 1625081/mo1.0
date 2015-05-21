class Subimage < ActiveRecord::Base
  mount_uploader :file, SubimageUploader
  belongs_to :image
end
