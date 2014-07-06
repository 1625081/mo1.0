class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  self.table_name = "profiles"
end
