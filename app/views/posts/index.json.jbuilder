json.array!(@posts) do |post|
  json.extract! post, :body, :tags, :published, :published_on
  json.url post_url(post, format: :json)
end