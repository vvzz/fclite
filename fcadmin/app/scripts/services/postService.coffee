'use strict'

angular.module('fcadminApp')
  .factory 'postService', (Restangular) ->

    basePosts = Restangular.all('posts')

    # Public API here
    {
      post: (post) ->
        basePosts.post(post)

      get: (id) ->
        basePosts.one(id)

      findAll: ->
        basePosts.getList()
    }
