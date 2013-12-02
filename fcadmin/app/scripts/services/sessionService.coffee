'use strict'

angular.module('fcadminApp')
  .factory 'sessionService', ($location, $q, $http) ->
    {
      currentUser: null,
      isAuthenticated: ->
        not not @currentUser

      requestCurrentUser: () ->
        deferred = $q.defer()
        if @isAuthenticated()
          deferred.resolve(@currentUser)
        else
          $http.get('/api/v1/current_user').then (response) =>
            @currentUser = response.data.user
            deferred.resolve(@currentUser)
        deferred.promise

      login: (email, password) ->
        $http.post '/api/v1/login',
          user:
            email: email
            password: password
        .then (response) =>
          @currentUser = response.data.user
          if @isAuthenticated()
            $location.path('/dashboard')

      logout: () ->
        $http.post('/api/v1/logout').then () =>
          @currentUser = null

    }
