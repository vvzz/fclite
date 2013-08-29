require ['jquery', 'backbone', 'marionette', 'views/PostView'], ($, Backbone, Marionette, PostView) ->

  # Start up the app once the DOM is ready
  $ ->
    @fcr = new Marionette.Application
    @fcr.addRegions
      mainRegion: '#fatcat'

    @fcr.addInitializer (options) ->
      Backbone.history.start()

    @fcr.addInitializer (options) =>
      @postView = new PostView()
      @fcr.mainRegion.show @postView

    @fcr.start()
