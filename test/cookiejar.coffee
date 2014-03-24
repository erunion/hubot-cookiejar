should = require 'should'
Path = require 'path'
Hubot = require 'hubot'

adapterPath = Path.join Path.dirname(require.resolve 'hubot'), 'src', 'adapters'
robot = Hubot.loadBot adapterPath, 'shell', true, 'MochaHubot'

{CookieJar} = require '../src/cookiejar'
cookiejar = new CookieJar 'cookies', robot

describe 'Plugin', ->
  it 'Should initialize with a flavor and a robot', ->
    cookiejar.robot.name.should.eql 'MochaHubot'
    cookiejar.flavor.should.eql 'cookies'

  it 'Should put and get a cookie in the jar', ->
    cookiejar.put('oatmeal', 5)
    cookiejar.get('oatmeal').should.eql 5

  it 'Should see if a cookie exists in the jar', ->
    cookiejar.put('snickerdoodle', 3)
    cookiejar.has('snickerdoodle').should.eql true

  it 'Should increment a cookie in the jar', ->
    cookiejar.put('chocolatechip', 4)
    cookiejar.increment('chocolatechip').should.eql 5
    cookiejar.increment('chocolatechip').should.eql 6

    cookiejar.increment('sugar').should.eql 1
    cookiejar.increment('sugar').should.eql 2

  it 'Should get a summary of all cookies', ->
    cookies = cookiejar.summary()

    cookies.should.be.a.array
    cookies.length.should.eql 4

    for sorted in cookies
      if sorted.item == 'chocolatechip'
        sorted.total.should.eql 6
      else if sorted.item == 'oatmeal'
        sorted.total.should.eql 5
      else if sorted.item == 'snickerdoodle'
        sorted.total.should.eql 3
      else if sorted.item == 'sugar'
        sorted.total.should.eql 2
