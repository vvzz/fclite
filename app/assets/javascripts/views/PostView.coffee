define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  PriceView = require 'views/PriceView'
  PostModel = require 'models/Post'
  postTpl = require 'text!templates/post.html'

  class PostView extends Marionette.Layout
    template: Handlebars.compile(postTpl)
    regions:
      price: "#price"

    onRender: ->
      post = new PostModel
      priceView = new PriceView(model: post)
      post.id = 1
      post.fetch()
      @price.show(priceView)


  return PostView
