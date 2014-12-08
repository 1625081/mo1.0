class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  self.table_name = "profiles"

  def power
  	return User.where("id = ?",self.user_id).last.power
  end
  
end
