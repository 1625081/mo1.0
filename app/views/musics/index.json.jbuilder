json.array!(@musics) do |music|
  json.extract! music, :id, :title, :user_id, :src, :file
  json.url music_url(music, format: :json)
end
