class Awesome.Post extends Batman.Model
  # Avoid minification galore
  @resourceName: 'post'
  @storageKey: 'posts'

  # Persist with extension of RESTStorage
  @persist Batman.RailsStorage

  # Define associations
  @hasMany 'comments', { inverseOf: 'post', saveInline: false }

  # Define attributes
  @encode 'title', 'body', 'tags', 'published'
  @encode 'publishedOn', Batman.Encoders.railsDate

  # Load Robin
  @set 'robin', new Batman.Robin(@)
