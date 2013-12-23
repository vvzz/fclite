'use strict'

angular.module('fcadminApp')
  .controller 'FctimepickerCtrl', ($scope) ->
    hours = [6..22]
    minutes = [0, 15, 30, 45]
    $scope.slots = []

    @addSlot = (hour) ->
      $scope.slots.push(hour + ":" + minute) for minute in minutes

    @addSlot(hour) for hour in hours




  .directive('fcTimePicker', () ->
    templateUrl: 'templates/fcTimePicker.html'
    restrict: 'E'
    require: 'ngModel'
    controller: 'FctimepickerCtrl'
    link: (scope, element, attrs) ->
      console.log("h")

  )
