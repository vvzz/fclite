'use strict'

describe 'Service: Postservice', () ->

  # load the service's module
  beforeEach module 'fcadminApp'

  # instantiate service
  Postservice = {}
  beforeEach inject (_Postservice_) ->
    Postservice = _Postservice_

  it 'should do something', () ->
    expect(!!Postservice).toBe true
