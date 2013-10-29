define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  addressTpl = require 'text!templates/address.html'

  class AddressView extends Marionette.ItemView
    template: Handlebars.compile(addressTpl)
    modelEvents:
      "change": "render"


  return AddressView

