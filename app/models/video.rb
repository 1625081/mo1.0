class Video < ActiveRecord::Base
  mount_uploader :cover, ThumbUploader
  has_one :score
  has_one :thumb
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  after_create do
    self.score = Score.new liker: [], favor: [], viewer: 0, editor_rec: []
    self.score.save
  end
  
  def search(keyword)
    msplit = self.title.split("#{keyword}",2) 
    return msplit[0] != self.title    
  end
  
  def mo_item
    {
      :thumb => cover.url,
      :thumb2 => "/noimg.jpeg",
       :updated_at => updated_at,
      :title => title,
      :sub_title => des,
      :author => {
        :avatar => User.find(user_id).avatar,
        :username => User.find(user_id).nickname,
        :user_id => User.find(user_id).id
      },
      :score => {
        :like => score.liker.size,
        :favors => score.favor,
        :favor => score.favor.size,
        :rate => score.generate_score
        
      },
      :class => "Video",
      :url => {
        :show => "/videos/#{id}",
        :owner => "/profile/#{user_id}",
      }
    }
  end
end
