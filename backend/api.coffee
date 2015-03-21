url = require('url')

user = require('./api/user')

module.exports = (request, response, body) ->
	path = url.parse(request.url).pathname
	args = path.split("/")
	
	if args[1] is not "api"
		return

	# remove '' and 'api'
	args.splice(0, 2)

	if args[0] is 'signup'
		return if body == ""
		body = JSON.parse(body)
		user.signup(request, body, (err, status) ->
			console.log status
			response.end(status)
		)
	else if args[0] is 'signin'
		return if body == ""
		body = JSON.parse(body)
		user.signin(request, body, (err, status, session) ->
			console.log status
		)

