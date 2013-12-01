'use strict'

angular.module('fcadminApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router'
])
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'loggedIn',
        templateUrl: 'views/layout.html'
      .state 'loggedIn.dashboard',
        url: '/dashboard',
        templateUrl: 'views/dashboard.html'
      .state 'loggedIn.post',
        url: '/post/new',
        templateUrl: 'views/post.html'

    # $routeProvider
      # .when '/',
        # templateUrl: 'views/home.html'
        # controller: 'MainCtrl'
      # .when '/users/login',
        # templateUrl: 'views/login.html'
        # controller: 'LoginCtrl'
      # .when '/dashboard',
        # templateUrl: 'views/dashboard.html'
      # .when '/post/new',
        # templateUrl: 'views/post.html'
      # .otherwise
        # redirectTo: '/'
