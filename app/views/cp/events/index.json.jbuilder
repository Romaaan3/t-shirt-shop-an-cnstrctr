json.array!(@cp_events) do |cp_event|
  json.extract! cp_event, :id, :title, :anons, :description
  json.url cp_event_url(cp_event, format: :json)
end
