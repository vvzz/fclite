define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  priceTpl = require 'text!templates/slotPicker.html'

  class SlotPickerView extends Marionette.ItemView
    template: Handlebars.compile(priceTpl)
    tagName: "div"
    className: "slotPicker"

    initialize: (options) ->
      # @$el.offset
        # top: options.top
        # left: options.left

  return SlotPickerView
