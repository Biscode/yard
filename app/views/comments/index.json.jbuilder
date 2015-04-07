json.array!(@comments) do |comment|
  json.extract! comment, :id, :pin_id, :body
  json.url comment_url(comment, format: :json)
end
