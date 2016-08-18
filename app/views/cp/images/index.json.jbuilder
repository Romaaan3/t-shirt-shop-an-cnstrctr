json.array!(@cp_images) do |cp_image|
  json.extract! cp_image, :id, :order_id
  json.url cp_image_url(cp_image, format: :json)
end
