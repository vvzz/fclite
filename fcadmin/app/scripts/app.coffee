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
        controller: 'LayoutCtrl'
      .state 'loggedIn.dashboard',
        url: '/dashboard'
        templateUrl: 'views/dashboard.html'
      .state 'loggedIn.post',
        url: '/post/new'
        templateUrl: 'views/post.html'
      .state 'loggedIn.schedule',
        templateUrl: 'views/schedule.html'
      .state 'loggedOut',
        url: '/users/login'
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'

  .config ($httpProvider) ->
    interceptor = ($location, $rootScope, $q) ->
      success = (response) ->
        response

      error = (response) ->
        if response.status is 401
          $rootScope.$broadcast('event:unauthorized')
          $location.path('/users/login')
          return response

      return (promise) ->
        promise.then(success, error)

    $httpProvider.responseInterceptors.push(interceptor)
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
