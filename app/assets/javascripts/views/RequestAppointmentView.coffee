define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  AppointmentModel = require 'models/Appointment'
  requestApptTpl = require 'text!templates/requestAppt.html'

  class RequestAppointmentView extends Marionette.ItemView
    template: Handlebars.compile(requestApptTpl)
    tagName: "div"
    className: "modal"
    events:
      'click #schedule' : 'scheduleAppointment'

    initialize: () ->
      @model.on 'error', @resetCaptcha, this
      @model.on 'sync', @appointmentSaved, this

    resetCaptcha: (errors) ->
      console.log(errors)
      Recaptcha.reload()

    onShow: (view) ->
      @$el.modal('show')

    onRender: ->
      Recaptcha.create("6Ldqmt0SAAAAAF8tJFRSPFLfCLvwWBe5fTUgVknN", @$el.find('#reCaptcha')[0], theme: 'clean')

    scheduleAppointment: (ev) ->
      @model.save(
        email: @$el.find('#inputEmail').val(),
        start: "",
        post_id: 1,
        authenticity_token: $("meta[name='csrf-token']").attr('content'),
        recaptcha_challenge_field: @$el.find('#recaptcha_challenge_field').val(),
        recaptcha_response_field: @$el.find('#recaptcha_response_field').val()
      )

    appointmentSaved: (model, resp, options) ->
      this.remove()
      # @view = new Rent.Views.Visits.ScheduledView(model: model)
      # $("#properties").html(@view.render().el)
      # router.navigate("#/" + @model.get('landlords_campaign_id') + '/scheduled', trigger: false)


  return RequestAppointmentView
