define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  PriceView = require 'views/PriceView'
  ScheduleView = require 'views/ScheduleView'
  AddressView = require 'views/AddressView'
  PostModel = require 'models/Post'
  postTpl = require 'text!templates/post.html'

  class PostView extends Marionette.Layout
    template: Handlebars.compile(postTpl)
    regions:
      price: "#price"
      schedule: "#schedule"
      address: "#address"

    initialize: (options) ->
      @id = if options.id then options.id else 1
      @post = new PostModel
      fcr.vent.on 'post:fetch', (ev) =>
        @post.fetch()

    onRender: ->
      priceView = new PriceView(model: @post)
      scheduleView = new ScheduleView(model: @post)
      addressView = new AddressView(model: @post)
      @post.id = @id
      @post.fetch()
      @price.show(priceView)
      @schedule.show(scheduleView)
      @address.show(addressView)


  return PostView
