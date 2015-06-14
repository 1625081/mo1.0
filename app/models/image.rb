require 'qiniu'
class Image < ActiveRecord::Base
  belongs_to :user
  has_one :score
  has_many :comments, dependent: :destroy
  has_many :subimages, dependent: :destroy
  include Rails.application.routes.url_helpers
  #mount_uploader :file, ImageUploader

  after_create do
    self.score = Score.new liker: [], favor: [], viewer: 0, editor_rec: []
    self.score.save
  end

  def search(keyword)
    msplit = self.title.split("#{keyword}",2) 
    return msplit[0] != self.title    
  end
  
  def mo_id
    "photo_#{id}"
  end

  def fixkey
    if keys[0]
      return keys[0]
    else
      return "/noimg.jpeg"
    end
  end
  
  def mo_item
    {
      :updated_at => updated_at,
      :thumb => "http://mosite.qiniudn.com/" + fixkey,
      :title => title,
      :sub_title => description.gsub(/<\/?.*?>/,""),
      :author => {
        :avatar => User.find(user_id).avatar,
        :username => User.find(user_id).nickname,
        :user_id => User.find(user_id).id
      },
      :class => "Image",
      :score => {
        :like => score.liker.size,
        :favor => score.favor.size,
        :favors => score.favor,
        :rate => score.generate_score
       },
      :url => {
        :show => "/images/#{id}",
        :owner => "/profile/#{user_id}",
      },
      :created_at => {
        :year => created_at.year,
        :month => created_at.month,
        :day => created_at.day,
        :hour => created_at.hour,
        :minute => created_at.min,
        :raw => created_at
      }
    }
  end

  def like (user)
    score.liker += [user.id]
    score.save
  end

  ##### WARNING !!!!! THIS IS A MONKEY PATH WORKING WITH UNKNOW ERORS !!!! #######
  #def method_missing(m,*a)  
#    if has_attributes? m || !(m.to_s =~ /=$/)
#      super
#    else
#      if m.to_s =~ /=$/  
#        self.exif[$`] = a[0]  
#      else  
#        raise NoMethodError, "#{m}这个方法你真的定义了嘛>~<人家木有找到耶……"   
#      end  
#    end
#  end 
end
