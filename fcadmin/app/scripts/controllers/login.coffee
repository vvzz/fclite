'use strict'

angular.module('fcadminApp')
  .controller 'LoginCtrl', ($scope, sessionService) ->
    $scope.login = ->
      sessionService.login($scope.inputEmail, $scope.inputPassword)
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
