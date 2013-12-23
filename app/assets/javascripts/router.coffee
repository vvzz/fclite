define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Backbone = require 'backbone'
  PostView = require 'views/PostView'

  class AppRouter extends Backbone.Router
    routes:
      'posts/:id' : 'showPost'
      'hi' : 'hi'
      '' : 'index'

    index: ->
      @postView = new PostView()
      @fcr.mainRegion.show @postView

    showPost: (id) ->
      postView = new PostView(id: id)
      window.fcr.mainRegion.show postView


  return AppRouter
