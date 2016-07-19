# Problem with Grape and Method not Allowed

This projects acts as an example for [Grape Issue #1414](https://github.com/ruby-grape/grape/issues/1444)

Grape comes with "Method not Allowed" funcionality out of the box.
Whenever you call a path with a HTTP verb you did not specify, grape will raise an error not allowed error.
This logic causes problems however if you have a before block specified.

Look at [server.rb](server.rb). It's a simple api that only has 1 GET route. The before block handles some analyzing of headers. If you call it, it returns a JSON.

```
curl -H "X-Secret-Header: secret_stuff" -X GET http://localhost:9292/my/stuff
```

Try the same thing with a DELETE request:

```
curl -H "X-Secret-Header: secret_stuff" -X DELETE http://localhost:9292/my/stuff
```

This causes a exception on your server (and even exposes the stacktrace in the response).
The reason for that is the fact, that `env` is `nil` in the before block when you come from that path.
