url = require('url')

api = require('./api')
database = require('./database')
database.init()

handler = (req, res) ->
	path = url.parse(req.url).pathname

	runApi = () ->
		try
			api(req, res, body)
		catch e
			console.log e
			console.log e.stack
			console.trace
			res.writeHead(500)
			res.end()

	body = ""
	req.on('data', (data) ->
		body += data.toString()
	)
	req.on('end', runApi)

	res.write("hello")
	res.end()

app = require('http').createServer(handler)

app.listen(8888)

