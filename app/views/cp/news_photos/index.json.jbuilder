json.array!(@cp_news_photos) do |cp_news_photo|
  json.extract! cp_news_photo, :id
  json.url cp_news_photo_url(cp_news_photo, format: :json)
end
