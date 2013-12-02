'use strict'

angular.module('fcadminApp')
  .controller 'LayoutCtrl', ($scope, sessionService) ->
    sessionService.requestCurrentUser().then (user) ->
      $scope.user = user

    $scope.logout = (event) ->
      sessionService.logout()
      event.preventDefault()
