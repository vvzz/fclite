'use strict'

angular.module('fcadminApp')
  .controller 'MainCtrl', ($scope, sessionService) ->
    $scope.logout = () ->
      sessionService.logout()

    sessionService.requestCurrentUser().then (user) ->
      $scope.user = user
