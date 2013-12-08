'use strict'

angular.module('fcadminApp')
  .controller 'PostCtrl', ($scope, postService) ->
    $scope.step = 0
    $scope.steps = ['Create Post', 'Schedule Availabilities']
    $scope.post = {}
    $scope.showing = {}

    $scope.$watch 'step', ->
      nextStep = $scope.step + 1
      if nextStep < $scope.steps.length
        $scope.nextText = 'Next: ' + $scope.steps[nextStep]
      else
        $scope.nextText = 'Submit'


    $scope.handlePrevious = ->
      unless $scope.isFirstStep()
        $scope.step = $scope.step - 1

    $scope.handleNext = ->
      if $scope.step + 1 is $scope.steps.length
        $scope.submit()
      else
        $scope.step = $scope.step + 1

    $scope.setCurrentStep = (step) ->
      $scope.step = step

    $scope.isCurrentStep = (step) ->
      step is $scope.step

    $scope.isFirstStep = ->
      $scope.step is 0

    $scope.isLastStep = ->

    $scope.submit = ->
      postService.post($scope.post)

    $scope.addShowing = ->
      console.log $scope.showing
      if not $scope.post.showings
        $scope.post.showings = []
      $scope.post.showings.push(_.clone($scope.showing))
      $scope.showing = {}

    $scope.removeShowing = (index) ->
      $scope.post.showings.splice(index, 1)




