'use strict'

angular.module('fcadminApp')
  .directive('fcApptDay', () ->
    templateUrl: 'templates/fcApptDay.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      console.log scope.day
      # element.text 'this is the fcApptDay directive'
  )
