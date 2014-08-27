json.array!(@dmvideos) do |dmvideo|
  json.extract! dmvideo, :id, :title, :user_id, :tudouid
  json.url dmvideo_url(dmvideo, format: :json)
end
