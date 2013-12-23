'use strict'

describe 'Controller: FctimepickerCtrl', () ->

  # load the controller's module
  beforeEach module 'fcliteApp'

  FctimepickerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    FctimepickerCtrl = $controller 'FctimepickerCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
