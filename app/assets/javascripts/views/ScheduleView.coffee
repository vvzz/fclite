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
        offset = slot.offset * 2
        if slot.morning
          @$el.find("#morning").append tpl
            offset: offset
            count: slot.morning
            period: "Morning"
        if slot.day
          @$el.find("#day").append tpl
            offset: offset
            count: slot.day
            period: "Day"
        if slot.evening
          @$el.find("#evening").append tpl
            offset: offset
            count: slot.evening
            period: "Evening"


    showApptSelector:(e) ->
      e.preventDefault()
      parentDiv = $(e.target).closest("div.span2")
      slots = []
      slotPickerView = new SlotPickerView
        collection: slots
      parentDiv.after(slotPickerView.render().el)



  return ScheduleView
