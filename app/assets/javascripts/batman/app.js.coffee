window.Awesome = class Awesome extends Batman.App
  @title = "I'm Awesome."

  Batman.config.pathToHTML = 'assets/batman/templates'

  # Prevent DOM flicker
  Batman.DOM.Yield.clearAllStale = -> {}

  # Define routes
  @resources 'posts'

  @root 'posts'

  @on 'run', ->
    Batman.developer.log "I'm open!"

    # Initialize sockets, connections, etc.
    # Anything not DOM related

  @on 'ready', ->
    Batman.developer.log "Awesome, we're ready."

    # Anything DOM related, go for it!
