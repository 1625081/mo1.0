class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :file, ImageUploader

  def to_jq_upload
    {
      "size" => file.size,
      "url" => file.url,
      "thumb_url" => file.thumb.url,
      "delete_url" => image_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
