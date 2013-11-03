require ['jquery', 'backbone', 'marionette', 'views/PostView', 'shared/ModalRegion'], ($, Backbone, Marionette, PostView, ModalRegion) ->

  # Start up the app once the DOM is ready
  $ ->
    @fcr = new Marionette.Application
    @fcr.addRegions
      mainRegion: '#fatcat'
      modal: ModalRegion

    @fcr.addInitializer (options) ->
      Backbone.history.start()

    @fcr.addInitializer (options) =>
      @postView = new PostView()
      @fcr.mainRegion.show @postView

    window.fcr = @fcr
    @fcr.start()
