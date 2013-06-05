class Awesome.PostsController extends Batman.Controller
  # Save from minification pain
  routingKey: 'posts'

  index: (params) ->
    # Set in controller context with =>
    Awesome.Post.load (err, results) =>
      throw err if err

      # Returns a Batman.Set
      @set 'posts', results

  show: (params) ->
    # Returns an IOU object that'll be loaded later
    # Don't use it if you plan to bind to it!
    Awesome.Post.find parseInt(params.id, 10), (err, record) =>
      if err
        throw err
      else
        @set 'post', record

  new: (params) ->
    @set 'post', new Awesome.Post

  create: (params) ->
    @get('post').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect '/posts'

  edit: (params) ->
    Awesome.Post.find parseInt(params.id, 10), (err, record) =>
      if err
        throw err
      else
        @set 'post', record

  update: (params) ->
    @get('post').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect '/posts'

  destroy: (node, callback, context) ->
    context.get('post').destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect '/posts'
