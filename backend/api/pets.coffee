database = require('../database')

exports.get_list = (req, body, callback) ->
	database.query("SELECT * FROM pets WHERE owner_id = '#{ req.userobj.id }'", (err, rows) ->
		callback(null, rows)
	)

