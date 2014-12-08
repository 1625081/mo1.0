class Article < ActiveRecord::Base
  belongs_to :user


	def owner
		User.where(id: user_id).last
	end


  def search(keyword)
    msplit = self.title.split("#{keyword}",2) 
    return msplit[0] != self.title    
  end
	
   def mo_item
    {
      :thumb => "/articleimg.jpg",
      :updated_at => updated_at,
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
       :class => "Article",
      :url => {
        :show => "/articles/#{id}",
        :owner => "/profile/#{user_id}",
      }
    }
  end
end

