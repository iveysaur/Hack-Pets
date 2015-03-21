url = require('url')
fs = require('fs')

api = require('./api')
database = require('./database')
database.init()

handler = (req, res) ->
	path = url.parse(req.url).pathname

	runApi = () ->
		if path.indexOf("api") == -1
			if path == "/"
				path = "/index.html"
			try
				res.end(fs.readFileSync("../frontend" + path))
			catch e
				console.log e
				res.end()
			return
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

app = require('http').createServer(handler)

app.listen(8888)

