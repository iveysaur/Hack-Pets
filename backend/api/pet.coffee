database = require('../database')

exports.post_create = (req, body, callback) ->
	database.query("SELECT name FROM pets WHERE name = '#{ database.escape(body.name) }'", (err, rows) ->
		return callback(null, false) if rows.length != 0

		database.query("INSERT INTO pets (owner_id, type, name, created) VALUES ('#{ body.userId }', '#{ body.id }', '#{ database.escape(body.name) }', '#{ new Date().getTime() / 1000 }')", (err, rows) ->
			return callback(null, { status: false }) if err or rows.length is 0

			callback(null, { status: true, pet: rows.id })
		)
	)

