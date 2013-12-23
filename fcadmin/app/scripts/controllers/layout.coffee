'use strict'

angular.module('fcadminApp')
  .controller 'LayoutCtrl', ($scope, sessionService, $location, postService) ->
    sessionService.requestCurrentUser().then (user) ->
      $scope.user = user
      postService.findAll().then (posts) ->
        $scope.posts = posts

    $scope.logout = (event) ->
      event.preventDefault()
      sessionService.logout()
      $location.path('/users/login')
