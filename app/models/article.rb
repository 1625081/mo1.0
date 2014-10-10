class Article < ActiveRecord::Base
	belongs_to :user

	def owner
		User.where(id: user_id).last
	end

	 def mo_item
    {
      :thumb => "articleimg.jpg",
      :thumbnil => "",
      :title => title,
      :sub_title => "",
      :author => {
        :avatar => User.find(user_id).avatar,
        :username => User.find(user_id).nickname,
        :user_id => User.find(user_id).id
      },
      :score => {
        :like => "",
        :favor => "",
        :rate => ""
      },
      :url => {
        :show => "/articles/#{id}"
      }
    }
  end
end
