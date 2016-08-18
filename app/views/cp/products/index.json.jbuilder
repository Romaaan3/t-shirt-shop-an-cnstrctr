json.array!(@cp_products) do |cp_product|
  json.extract! cp_product, :id, :name, :description, :type
  json.url cp_product_url(cp_product, format: :json)
end
