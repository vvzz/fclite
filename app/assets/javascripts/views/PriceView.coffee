define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  priceTpl = require 'text!templates/price.html'

  class PriceView extends Marionette.ItemView
    template: Handlebars.compile(priceTpl)


  return PriceView
