class Awesome.CommentsController extends Batman.Controller
  # Save from minification pain
  routingKey: 'comments'

  create: (params) ->
    @get('comment').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @set 'comment', new Awesome.Comment(post_id: @get('comment.post.id'))
