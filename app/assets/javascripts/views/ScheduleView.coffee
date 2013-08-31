define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  SlotPickerView = require 'views/SlotPickerView'
  moment = require 'moment'
  scheduleTpl = require 'text!templates/schedule.html'
  dayTpl = require 'text!templates/day.html'
  slotTpl = require 'text!templates/slotSelector.html'

  class ScheduleView extends Marionette.ItemView
    template: Handlebars.compile(scheduleTpl)
    modelEvents:
      "change": "renderTimeSlots"
    events:
      "click .getAppts": "showApptSelector"

    makeDay: (i) ->
      moment.lang 'en',
        calendar:
          lastDay: '[Yesterday]',
          sameDay: '[Today]',
          nextDay: '[Tomorrow]',
          lastWeek: '[last] dddd [at] LT',
          nextWeek: 'dddd',
          sameElse: 'L'
      date = moment().add('days', i)
      day =
        monthName: date.format('MMM'),
        day: date.format('D'),
        dayName: date.calendar()
      return day

    onRender: () ->
      @renderOneDayHeader(@makeDay i) for i in [0..5]

    renderOneDayHeader: (day) ->
      tpl = Handlebars.compile(dayTpl, day)
      @$el.find("#days").append(tpl(day))

    renderTimeSlots: ->
      slots = {}
      daysEl = @$el.find("#days > div.day")
      _.each @model.get('timeslots'), (timeslot) =>
        offset = moment(timeslot.start).diff(new Date(), 'days')
        startHour = moment(timeslot.start).hours()

        slots[offset] ?= {}
        slots[offset].offset = offset
        if 0 < startHour < 12
          slots[offset].morning ?= 0
          slots[offset].morning = slots[offset].morning + 1
        else if 12 < startHour < 18
          slots[offset].day ?= 0
          slots[offset].day= slots[offset].day + 1
        else if 18 < startHour < 24
          slots[offset].evening ?= 0
          slots[offset].evening = slots[offset].evening + 1


      _.each slots, (slot) =>
        tpl = Handlebars.compile(slotTpl)
        daysEl.eq(slot.offset).find('.date').append(tpl(slot))


    showApptSelector:(e) ->
      e.preventDefault()
      slotPickerView = new SlotPickerView
        top: $(e.target).closest("div.slot").offset().top
        left: 200
      $('body').append(slotPickerView.render().el)



  return ScheduleView
