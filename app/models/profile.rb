class Profile < ActiveRecord::Base
  belongs_to :user
  self.table_name = "profiles"
end
