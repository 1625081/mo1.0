class Music < ActiveRecord::Base
  mount_uploader :file, MusicUploader

  def to_jq_upload
    {
      "name" => read_attribute(:music),
      "size" =>music.size,
      "url" =>music.url,
      "thumbnail_url" =>music.thumb.url,
      "delete_url" => music_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end

end
