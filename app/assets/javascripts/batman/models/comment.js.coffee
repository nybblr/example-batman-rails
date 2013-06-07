class Awesome.Comment extends Batman.Model
  # Avoid minification galore
  @resourceName: 'comment'
  @storageKey: 'comments'

  # Persist with extension of RESTStorage
  @persist Batman.RailsStorage

  @belongsTo 'post', { inverseOf: 'comments' }

  # Define attributes
  @encode 'author', 'body', 'post_id'

  # Nesting
  @urlNestsUnder 'post'

  # Load Robin
  @set 'robin', new Batman.Robin(@)
