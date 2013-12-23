'use strict'

angular.module('fcadminApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngAnimate',
  'restangular',
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
        controller: 'DashboardCtrl'
      .state 'loggedIn.post',
        url: '/post/new'
        templateUrl: 'views/post.html'
        controller: 'PostCtrl'
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

  .config (RestangularProvider) ->
    RestangularProvider.setBaseUrl('/api/v1')
    RestangularProvider.setRequestInterceptor (elem, operation, what) ->
      retElem = elem
      if operation is 'post' or operation is 'put'
        wrapper = {}
        wrapper[what.substring(0, what.length - 1)] = elem
        retElem = wrapper

      return retElem


