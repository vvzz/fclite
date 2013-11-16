'use strict'

angular.module('fcadminApp')
  .factory 'sessionService', ($location, $http) ->
    # Service logic
    # ...

    meaningOfLife = 42

    # Public API here
    {
      login: (email, password) ->
        $http.post '/api/login',
          user:
            email: email
            password: password
    }
