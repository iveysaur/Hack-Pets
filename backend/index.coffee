handler = (req, res) ->
	res.write("hello")
	res.end()

app = require('http').createServer(handler)

app.listen(8888)

