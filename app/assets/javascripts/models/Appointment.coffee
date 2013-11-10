define (require) ->
  $ = require 'jquery'
  Backbone = require 'backbone'

  class AppointmentModel extends Backbone.Model
    urlRoot: '/api/v1/posts/1/appointments'

  return AppointmentModel

