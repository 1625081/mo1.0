class Article < ActiveRecord::Base
	belongs_to :user

	def owner
		User.where(id: user_id).last
	end
end
