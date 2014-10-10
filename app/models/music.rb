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

  def mo_item
    {
      :thumb => cover.url,
      :thumb2 => "noimg.jpeg",
      :thumbnil => "",
      :title => title,
      :sub_title => des,
      :author => {
        :avatar => User.find(user_id).avatar,
        :username => User.find(user_id).nickname,
        :user_id => User.find(user_id).id
      },
      :score => {
        :like => score.liker.size,
        :favor => score.favor.size,
        :rate => score.generate_score
      },
      :url => {
        :show => "/musics/#{id}"
      }
    }
  end
end
