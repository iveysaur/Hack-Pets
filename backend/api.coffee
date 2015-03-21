url = require('url')

user = require('./api/user')
userModel = require('./models/user')

endpoints = {}

endpoints["user"] = require('./api/user')
endpoints["npc"] = require('./api/npc')
endpoints["pet"] = require('./api/pet')
endpoints["pets"] = require('./api/pets')
endpoints["inventory"] = require('./api/inventory')
endpoints["npcshop"] = require('./api/npcshop')
endpoints["game"] = require('./api/game')

module.exports = (request, response, body) ->
	path = url.parse(request.url).pathname
	args = path.split("/")
	method = request.method.toLowerCase()
	sessionid = request.headers["x-x"] or ""

	return do404(response) if args[1] is not "api"

	# remove '' and 'api'
	args.splice(0, 2)

	return do404(response) if not endpoints[args[0]]

	json = null
	if body
		try
			json = JSON.parse(body)
		catch e
			console.log e

	callback = (err, result, headers) ->
		if err
			console.log(err)
			console.trace()
			response.writeHead(500)
			response.end(JSON.stringify(err))
		else
			response.writeHead(200, headers or { "Cache-Control": "no-cache", "Access-Control-Allow-Credentials": "true" })
			response.end(JSON.stringify(result))

	request.body = body
	request.args = args

	endpoint = endpoints[args[0]]["public_#{ method }_#{ args[1] }"]
	return endpoint(request, json, callback) if endpoint?

	console.log args
	if endpoint = endpoints[args[0]]["#{ method }_#{ args[1] }"]
		s = sessionid.split(',')
		userModel.verifyAuth(~~s[0], s[1], (success, userobj) ->
			if success
				request.userobj = userobj
				endpoint(request, json, callback)
			else
				console.log "Auth failed: #{ sessionid }"
				do404(response)
		)

do404 = (response) ->
	response.writeHead(404)
	response.end("404")

