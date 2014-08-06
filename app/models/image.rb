class Image < ActiveRecord::Base
  belongs_to :user
  has_one :score
  include Rails.application.routes.url_helpers
  #mount_uploader :file, ImageUploader

  after_create do
    self.score = Score.new liker: [], favor: [], viewer: 0, editor_rec: []
    self.save
  end

  def to_jq_upload
    {
      "size" => file.size,
      "url" => file.url,
      "thumb_url" => file.thumb.url,
      "delete_url" => image_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end

  def self.exif_include(*attrs)
    attrs.each do |attr|
      self.class_eval %Q{
        def #{attr}
          exif[:#{attr}]
        end

        def #{attr}=(something)
          exif[:#{attr}] = something
        end
      }
    end
  end

  def like (user)
    score.liker += [user.id]
    score.save
  end

  exif_include :camera, :aperture, :iso, :focal_length,
               :width, :height, :token_at, :exposure_time,
               :size, :color_space

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
