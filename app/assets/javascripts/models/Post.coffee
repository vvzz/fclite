define (require) ->
  $ = require 'jquery'
  Backbone = require 'backbone'

  class PostModel extends Backbone.Model

    defaults:
      rent: 5000

  return PostModel

