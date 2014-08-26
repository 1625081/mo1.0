class Video < ActiveRecord::Base
  has_one :thumb

  mount_uploader :cover, ThumbUploader
  def mo_item
    {
      :thumb => file,
      :title => title,
      :sub_title => description,
      :author => {
        :avatar => User.find(user_id).avatar,
        :username => User.find(user_id).nickname
      },
      :score => {
        :like => score.liker.size,
        :favor => score.favor.size,
        :rate => score.generate_score
      },
      :url => {
        :show => "/images/#{id}"
      }
    }
  end
end
