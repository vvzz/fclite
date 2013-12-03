'use strict'

angular.module('fcadminApp')
  .controller 'LayoutCtrl', ($scope, sessionService, $location) ->
    sessionService.requestCurrentUser().then (user) ->
      $scope.user = user

    $scope.logout = (event) ->
      event.preventDefault()
      sessionService.logout()
      $location.path('/users/login')
