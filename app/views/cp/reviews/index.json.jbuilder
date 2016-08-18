json.array!(@cp_reviews) do |cp_review|
  json.extract! cp_review, :id, :name, :cause, :comment, :isValid
  json.url cp_review_url(cp_review, format: :json)
end
