define (require) ->
  $ = require 'jquery'
  Backbone = require 'backbone'

  class PostModel extends Backbone.Model
    urlRoot: '/api/v1/posts'
    defaults:
      monthly: 0

    total: ->
      @get('monthly') + @get('security') + @lastMonth()

    lastMonth: ->
      @get('monthly')

    toJSON: ->
      json = Backbone.Model.prototype.toJSON.apply(this, arguments)
      json.total = @total()
      json

  return PostModel

