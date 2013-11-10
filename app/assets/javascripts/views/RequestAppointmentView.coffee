define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  FlashView = require 'views/flashView'
  AppointmentModel = require 'models/Appointment'
  requestApptTpl = require 'text!templates/requestAppt.html'

  class RequestAppointmentView extends Marionette.Layout
    template: Handlebars.compile(requestApptTpl)
    tagName: "div"
    className: "modal"
    events:
      'click #schedule' : 'scheduleAppointment'
    modelEvents:
      'sync': 'appointmentSaved'
      'error': 'resetCaptcha'
    regions:
      flash: '#flash'


    resetCaptcha: (model, xhr, options) ->
      Recaptcha.reload()

    onShow: (view) ->
      @$el.modal('show')

    onRender: ->
      flashView = new FlashView(
        errorModel: @model
      )
      @flash.show(flashView)
      Recaptcha.create("6Ldqmt0SAAAAAF8tJFRSPFLfCLvwWBe5fTUgVknN", @$el.find('#reCaptcha')[0], theme: 'clean')

    scheduleAppointment: (ev) ->
      @model.save(
        email: @$el.find('#inputEmail').val(),
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
