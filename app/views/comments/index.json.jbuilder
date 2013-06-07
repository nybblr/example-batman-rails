json.array!(@comments) do |comment|
  json.extract! comment, *comment.attribute_names
end
