define (require) ->
  $ = require 'jquery'
  Backbone = require 'backbone'

  class PostModel extends Backbone.Model
    urlRoot: '/api/v1/posts'


  return PostModel

