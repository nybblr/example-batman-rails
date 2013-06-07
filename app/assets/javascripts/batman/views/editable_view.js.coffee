class Awesome.EditableView extends Batman.View
  @option 'data', 'record'

  constructor: ->
    super # process arguments and stuff
    @node = $(@get('node'))

    # Add editableness
    @node.attr('contenteditable', 'true')

  ready: ->
    return unless @node?

    # console.log @get('data')?.constructor.name
    keypath = @get('argumentBindings.data').keyPath

    window.context = @context.contextForKey(keypath)
    window.view = @
    window.node = @node

    try
      @prop = @context.contextForKey(keypath).property(keypath)

    if @prop
      @prop.observeAndFire (newValue, oldValue) =>
        @node.html(@prop.getValue())

    @node
    .focus (event) =>
      self = $(event.target)
      self.data 'before', self.html()
      @prop.setValue(self.html())
      return self
    .on 'blur keyup keydown paste hallomodified', (event) =>
      self = $(event.target)
      if self.data('before') isnt self.html()
        self.data 'before', self.html()
        @prop.setValue(self.html())
        self.trigger('change')
      return self
    .on 'blur', (event) =>
      @get('record').save()
    .hallo
      plugins:
        "halloformat": {}
        "hallolists": {}
