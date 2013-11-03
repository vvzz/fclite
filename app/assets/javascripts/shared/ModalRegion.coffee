define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'

  class ModalRegion extends Backbone.Marionette.Region
    el: "#modal"

    constructor:() ->
      Backbone.Marionette.Region.prototype.constructor.apply(this, arguments)
      @on("view:show", @showModal, this)

    getEl: (selector) ->
      $el = $(selector)
      $el.on("hidden", @close)
      $el

    showModal: (view) ->
      view.on("close", @hideModal, this)
      @$el.modal('show');

    hideModal:() ->
      @$el.modal('hide');

  return ModalRegion
