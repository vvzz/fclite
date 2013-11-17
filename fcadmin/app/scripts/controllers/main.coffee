'use strict'

angular.module('fcadminApp')
  .controller 'MainCtrl', ($scope, sessionService) ->
    sessionService.requestCurrentUser().then (user) ->
      $scope.user = user
