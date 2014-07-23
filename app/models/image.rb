class Image < ActiveRecord::Base
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
end
