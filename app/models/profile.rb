class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  self.table_name = "profiles"
  validates :nickname , presence: true
  validates :nickname , uniqueness: {case_sensitive: false}

  def power
  	return User.where("id = ?",self.user_id).last.power
  end
  
end
