'use strict'

angular.module('fcadminApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/users/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
      .otherwise
        redirectTo: '/'
