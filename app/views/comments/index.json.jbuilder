json.array!(@comments) do |comment|
  json.extract! comment, :post_id, :author, :body
  json.url post_comment_url(comment.post, comment, format: :json)
end
