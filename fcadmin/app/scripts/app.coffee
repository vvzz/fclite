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
        templateUrl: 'views/home.html'
        controller: 'MainCtrl'
      .when '/users/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
      .when '/dashboard',
        templateUrl: 'views/dashboard.html'
      .otherwise
        redirectTo: '/'
