json.array!(@cp_orders) do |cp_order|
  json.extract! cp_order, :id, :name, :mobile, :email, :comment
  json.url cp_order_url(cp_order, format: :json)
end
