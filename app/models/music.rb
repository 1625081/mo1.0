class Music < ActiveRecord::Base
  mount_uploader :file, MusicUploader
  mount_uploader :cover, ThumbUploader
  belongs_to :user
  has_one :score
  has_one :thumb
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
      :thumbnil => "",
      :title => title,
      :sub_title => des,
      :author => {
        :avatar => User.find(user_id).avatar,
        :username => User.find(user_id).nickname,
        :user_id => User.find(user_id).id
      },
      :class => "Music",
      :score => {
        :like => score.liker.size,
        :favor => score.favor.size,
        :favors => score.favor,
        :rate => score.generate_score
      },
      :url => {
        :show => "/musics/#{id}",
        :owner => "/profile/#{user_id}",
      },
      :item => self
    }
  end
end
