class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" =>image.size,
      "url" =>image.url,
      "thumbnail_url" =>image.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
