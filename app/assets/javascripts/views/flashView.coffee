define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  flashTpl = require 'text!templates/flash.html'

  class ErrorCollection extends Backbone.Collection


  class FlashView extends Marionette.ItemView
    template: Handlebars.compile(flashTpl)
    initialize: (options) ->
      @options.errorModel.on 'error', @addErrors, this

    addErrors: (model, xhr, options) ->
      errors = _.map JSON.parse(xhr.responseText), (value) ->
        "error": value
      @collection = new ErrorCollection(errors)
      @render()

  return FlashView




