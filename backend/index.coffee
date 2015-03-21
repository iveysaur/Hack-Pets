url = require('url')

api = require('./api')

mockSignup =
	username: "test"
	password: "testlol"
	email: "test@test.com"

handler = (req, res) ->
	path = url.parse(req.url).pathname

	body = ""
	body = JSON.stringify(mockSignup)
	api(req, res, body)

	res.write("hello")
	res.end()

app = require('http').createServer(handler)

app.listen(8888)

