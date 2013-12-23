'use strict'

describe 'Directive: fcApptDay', () ->

  # load the directive's module
  beforeEach module 'fcadminApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<fc-appt-day></fc-appt-day>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the fcApptDay directive'
