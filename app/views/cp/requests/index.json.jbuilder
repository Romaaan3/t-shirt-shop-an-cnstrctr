json.array!(@cp_requests) do |cp_request|
  json.extract! cp_request, :id, :name, :email, :comment
  json.url cp_request_url(cp_request, format: :json)
end
