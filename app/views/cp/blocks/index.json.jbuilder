json.array!(@cp_blocks) do |cp_block|
  json.extract! cp_block, :id, :name, :text, :title, :description, :keywords
  json.url cp_block_url(cp_block, format: :json)
end
