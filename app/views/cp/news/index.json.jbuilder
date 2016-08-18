json.array!(@cp_news) do |cp_news|
  json.extract! cp_news, :id, :title, :description, :anons
  json.url cp_news_url(cp_news, format: :json)
end
