# hubot-cookiejar

[![NPM](https://nodei.co/npm/hubot-cookiejar.png)](https://nodei.co/npm/hubot-cookiejar/)

[![Build Status](https://travis-ci.org/jonursenbach/hubot-cookiejar.png)](https://travis-ci.org/jonursenbach/hubot-cookiejar)

A [Hubot](https://github.com/github/hubot) library for plugins to store countable items into a cookie jar.

For an example, the [hubot-punjar](https://github.com/jonursenbach/hubot-punjar) plugin uses it to store the name of a user every time they write a shitty pun in chat. Someone reports them, and they're "forced" to deposit $1 into the pun jar.

## Usage
### Instantiation
```
{CookieJar} = require 'hubot-cookiejar'
cookiejar = new CookieJar 'oatmeal', robot
```

### .get()
```
cookiejar.get('item')
```

### .put()
Put a give number of items into the cookie jar.

```
cookiejar.put('item', 5)
```

### .has()
Returns if there are cookies in the jar for a given ```item```.

```
cookiejar.has('item')
```

### .increment()
Increment the number of cookies in the jar for a given ```item```.

```
cookiejar.increment('item')
```

### .summary()
Pull an array out of the cookie jar containing every item and its sum. The array is sorted descending order by the number of sum of each items.

```
cookies = cookiejar.summary()
```

Output:

```
[ { item: 'chocolatechip', total: 6 },
  { item: 'oatmeal', total: 5 },
  { item: 'snickerdoodle', total: 3 },
  { item: 'sugar', total: 2 } ]
```
