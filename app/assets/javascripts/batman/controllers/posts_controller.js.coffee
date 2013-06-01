class Awesome.PostsController extends Batman.Controller
  # Save from minification pain
  routingKey: 'posts'

  index: (params) ->
    # Set in controller context with =>
    Awesome.Post.load (err, results) =>
      # Returns a Batman.Set
      @set 'posts', results

  show: (params) ->
    # Returns an IOU object that'll be loaded later
    @set 'post', Awesome.Post.find parseInt(params.id, 10), (err) ->
      throw err if err
