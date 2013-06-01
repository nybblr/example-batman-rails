class Awesome.Post extends Batman.Model
  # Avoid minification galore
  @resourceName: 'post'
  @storageKey: 'posts'

  # Persist with extension of RESTStorage
  @persist Batman.RailsStorage

  # Define attributes
  @encode 'title', 'body', 'tags', 'published', 'publishedOn'
