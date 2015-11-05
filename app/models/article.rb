class Article < ActiveRecord::Base
  mount_uploader :cover, ThumbUploader 
  belongs_to :user
  has_one :thumb
  has_one :score
  has_many :comments, dependent: :destroy

  after_create do
    self.score = Score.new liker: [], favor: [], viewer: 0, editor_rec: []
    self.score.save
  end
	
  def owner
		User.where(id: user_id).last
	end


  def search(keyword)
    msplit = self.title.split("#{keyword}",2) 
    return msplit[0] != self.title    
  end
	
   def mo_item
    {
      :thumb => cover.url,
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
        :like => score.liker.size,
        :likers => score.liker,
        :favors => score.favor,
        :favor => score.favor.size,
        :rate => score.generate_score
      },
       :class => "Article",
      :url => {
        :show => "/articles/#{id}",
        :owner => "/profile/#{user_id}",
      },
      :item => self
    }
  end
end

