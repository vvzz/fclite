define (require) ->
  $ = require 'jquery'
  Backbone = require 'backbone'
  moment = require 'moment'

  class SlotModel extends Backbone.Model
    toJSON: ->
      start: moment(@get('start')).format('h:mmA')
      free: @get('free')

  class SlotCollection extends Backbone.Collection
    model: SlotModel

  return SlotCollection

