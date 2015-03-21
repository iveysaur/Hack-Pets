url = require('url')

module.exports = (request, response, body) ->
	path = url.parse(request.url).pathname
	args = path.split("/")
	
	if args[1] is not "api"
		return

	# remove '' and 'api'
	args.splice(0, 2)

	if args[0] is 'signup'
		console.log "signup!"
		# do database stuff

