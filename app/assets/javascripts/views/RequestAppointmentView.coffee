define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  requestApptTpl = require 'text!templates/requestAppt.html'

  class RequestAppointmentView extends Marionette.ItemView
    template: Handlebars.compile(requestApptTpl)
    tagName: "div"

    onShow: (view) ->
      @$el.modal('show')

  return RequestAppointmentView
