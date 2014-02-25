class CookieJar
  constructor: (flavor, robot) ->
    @robot = robot
    @flavor = flavor

    @robot.brain.data.jar ||= {}
    @robot.brain.data.jar[@flavor] ||= {}

  get: (item) ->
    return @robot.brain.data.jar[@flavor][item]

  put: (item, data) ->
    @robot.brain.data.jar[@flavor][item] = data

  has: (item) ->
    return typeof @robot.brain.data.jar[@flavor][item] != 'undefined'

  increment: (item) ->
    if @has item
      @robot.brain.data.jar[@flavor][item] += 1
    else
      @robot.brain.data.jar[@flavor][item] = 1

  summary: ->
    array = []

    items = for item, data of @robot.brain.data.jar[@flavor]
      array.push {'item': item, 'total': @robot.brain.data.jar[@flavor][item]}

    array.sort (a, b) ->
      if a.total < b.total
        return 1
      if a.total > b.total
        return -1
      return 0

    return array

exports.CookieJar = CookieJar
