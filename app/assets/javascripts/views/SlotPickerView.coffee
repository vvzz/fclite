define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  RequestAppointmentView = require 'views/RequestAppointmentView'
  priceTpl = require 'text!templates/slotPicker.html'

  class SlotPickerView extends Marionette.ItemView
    template: Handlebars.compile(priceTpl)
    tagName: "div"
    className: "slotPicker"
    events:
      'click .appointment': 'showRequestAppointment'

    initialize: (options)->
      _.bindAll(this, 'remove')
      @$el.offset(options.offset)


    onRender: ->
      $('body').on('click', @remove)

    remove: (ev) ->
      unless (@$el.is(ev.target) or @$el.has(ev.target).length > 0)
        $('body').off('click', @remove)
        @$el.remove()

    showRequestAppointment: (ev) ->
      ev.preventDefault()
      reqView = new RequestAppointmentView()
      window.fcr.modal.show(reqView)






  return SlotPickerView
