'use strict'

angular.module('fcadminApp')
  .controller 'DashboardCtrl', ($scope) ->
    $scope.hours = (moment().hour(hour).minute(0).format('HH:mmA') for hour in [9..22])
    $scope.days = (moment().add('days', day) for day in [0..4])
