json.array!(@posts) do |post|
  json.extract! post, *post.attribute_names
  json.url post_url(post, format: :json)
end
