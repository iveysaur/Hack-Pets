database = require('../database')

exports.get_list = (req, body, callback) ->
	database.query("SELECT * FROM pets WHERE owner_id = '#{ req.userobj.id }'", (err, rows) ->
		callback(null, rows)
	)

exports.public_get_pet = (req, body, callback) ->
	database.query("SELECT * FROM pets WHERE id = '#{ req.args[2] }'", (err, rows) ->
		callback(null, rows[0])
	)

