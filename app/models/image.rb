class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :file, ImageUploader

  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" =>file.size,
      "url" =>file.url,
      "thumbnail_url" =>file.thumb.url,

      "delete_url" => image_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end

  def self.has_size_of(*sizes)
    sizes.each do |size|
      self.class_eval %Q{
        def #{size}_url
          if Rails.enc.production?
            "http://cmw-mo.qiniudn.com/images/#{size}_#{self.id}.jpg"
          else
            "#{size}_#{self.id}.jpg"
          end
        end
      }
    end
  end

  has_size_of :thumb, :large, :xlarge
end
