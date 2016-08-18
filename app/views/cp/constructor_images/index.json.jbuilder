json.array!(@cp_constructor_images) do |cp_constructor_image|
  json.extract! cp_constructor_image, :id
  json.url cp_constructor_image_url(cp_constructor_image, format: :json)
end
