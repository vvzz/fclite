define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  RequestAppointmentView = require 'views/RequestAppointmentView'
  AppointmentModel = require 'models/Appointment'
  priceTpl = require 'text!templates/slotPicker.html'

  class SlotPickerView extends Marionette.ItemView
    template: Handlebars.compile(priceTpl)
    tagName: "li"
    className: "appointment"
    events:
      'click a': 'showRequestAppointment'

    onBeforeRender: () ->
      unless @model.get('free') == true
        @$el.addClass('busy')

    showRequestAppointment: (ev) ->
      ev.preventDefault()
      reqView = new RequestAppointmentView(
        model: new AppointmentModel(
          post_id: @model.get('post_id')
          start: @model.get('start')
        )
      )
      window.fcr.modal.show(reqView)

  class SlotPickerCollectionView extends Marionette.CollectionView
    template: Handlebars.compile("<ul></li>")
    itemView: SlotPickerView
    tagName: "ul"
    className: "slotPicker"

    initialize: (options) ->
      _.bindAll(this, 'remove')
      @$el.offset(options.offset)

    onRender: ->
      $('body').on('click', @remove)

    remove: (ev) ->
      unless (@$el.is(ev.target) or @$el.has(ev.target).length > 0)
        $('body').off('click', @remove)
        @$el.remove()

  return SlotPickerCollectionView
