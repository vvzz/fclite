'use strict'

angular.module('fcadminApp')
  .directive('fcDayPicker', () ->
    templateUrl: 'templates/fcDayPicker.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      scope.days = []

      scope.days.push(
        label: 'Today'
        date: moment().format('YYYY-MM-DD')
      )
      scope.days.push(
        label: 'Tomorrow'
        date: moment().add('days', 1).format('YYYY-MM-DD')
      )
      addDay = (n) ->
        day = moment().add('days', n)
        scope.days.push(
          label: day.format('ddd MMM, Do')
          date: day.format('YYYY-MM-DD')
        )

      addDay(n) for n in [2..4]

      scope.pickDay = (day) ->
        scope.showing.date = day.date

  )
