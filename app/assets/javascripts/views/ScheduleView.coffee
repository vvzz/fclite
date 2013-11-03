define (require) ->
  $ = require 'jquery'
  Marionette = require 'marionette'
  Handlebars = require 'handlebars'
  SlotPickerView = require 'views/SlotPickerView'
  SlotCollection = require 'models/SlotCollection'
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
      @slots = {}
      daysEl = @$el.find("#days > div.day")
      _.each @model.get('timeslots'), (timeslot) =>
        offset = Math.ceil(moment(timeslot.start).diff(new Date(), 'days', true))
        startHour = moment(timeslot.start).hours()

        @slots[offset] ?= {}
        @slots[offset].offset = offset
        if 0 < startHour < 12
          @slots[offset].morning ?= []
          @slots[offset].morning.push(timeslot)
        else if 12 < startHour < 18
          @slots[offset].day ?= []
          @slots[offset].day.push(timeslot)
        else if 18 < startHour < 24
          @slots[offset].evening ?= []
          @slots[offset].evening.push(timeslot)


      _.each @slots, (slot) =>
        tpl = Handlebars.compile(slotTpl)
        offset = slot.offset * 2
        if slot.morning
          @$el.find("#morning").append tpl
            offset: offset
            count: _.where(slot.morning, {'free': true}).length
            period: "Morning"
        if slot.day
          @$el.find("#day").append tpl
            offset: offset
            count: _.where(slot.day, {'free': true}).length
            period: "Day"
        if slot.evening
          @$el.find("#evening").append tpl
            offset: offset
            count: _.where(slot.evening, {'free': true}).length
            period: "Evening"


    showApptSelector:(e) ->
      e.stopPropagation()
      e.preventDefault()
      parentDiv = $(e.target).closest("div.span2")
      slotPickerView = new SlotPickerView
        collection: new SlotCollection(@slots[$(e.target).data('offset')/2][$(e.target).data('period').toLowerCase()])
        offset:
          top: parentDiv.offset().top
          left: parentDiv.offset().left + parentDiv.outerWidth()
      $('body').append(slotPickerView.render().el)



  return ScheduleView
