class Awesome.PostsController extends Batman.Controller
  # Save from minification pain
  routingKey: 'posts'

  index: (params) ->
    # Set in controller context with =>
    Awesome.Post.load (err, results) =>
      # `results` is an IOU and won't
      # be updated when records
      # are added or deleted
      throw err if err

      # Returns a Batman.Set
      @set 'posts', Awesome.Post.get('loaded')

  show: (params) ->
    Awesome.set 'controllers.comments.comment',
      new Awesome.Comment(post_id: params.id)
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
