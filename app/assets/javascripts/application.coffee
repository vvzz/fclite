require ['jquery', 'backbone', 'marionette', 'views/PostView', 'shared/ModalRegion', 'router'], ($, Backbone, Marionette, PostView, ModalRegion, AppRouter) ->


  # Start up the app once the DOM is ready
  $ ->
    @fcr = new Marionette.Application
    @fcr.addRegions
      mainRegion: '#fatcat'
      modal: ModalRegion

    @fcr.addInitializer (options) ->
      new AppRouter()

    @fcr.addInitializer (options) =>
      @postView = new PostView()
      @fcr.mainRegion.show @postView

    @fcr.on 'initialize:after', ->
      console.log('history start')
      Backbone.history.start(pushstate: true)

    window.fcr = @fcr
    @fcr.start()
