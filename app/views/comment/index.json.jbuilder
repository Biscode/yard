json.array!(@comment) do |comment|
  json.extract! comment, :id, :body, :post_id
  json.url comment_url(comment, format: :json)
end
