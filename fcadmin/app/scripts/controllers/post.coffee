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
      if not $scope.post.availabilities_attributes
        $scope.post.availabilities_attributes = []
      showing = _.clone($scope.showing)
      showing.start = showing.date + " " + showing.from
      showing.end = showing.date + " " + showing.to
      showing.slotSize = 15
      $scope.post.availabilities_attributes.push(showing)
      $scope.showing = {}

    $scope.removeShowing = (index) ->
      $scope.post.availabilities_attributes.splice(index, 1)




