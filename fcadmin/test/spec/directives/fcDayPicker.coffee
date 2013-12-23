'use strict'

describe 'Directive: fcDayPicker', () ->

  # load the directive's module
  beforeEach module 'fcadminApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<fc-day-picker></fc-day-picker>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the fcDayPicker directive'
