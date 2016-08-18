json.array!(@cp_subscribers) do |cp_subscriber|
  json.extract! cp_subscriber, :id, :email, :active
  json.url cp_subscriber_url(cp_subscriber, format: :json)
end
