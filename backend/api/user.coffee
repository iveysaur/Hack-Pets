database = require('../database')
userModel = require('../models/user.coffee')

exports.signup = (req, body, callback) ->
	database.query("SELECT username FROM users WHERE username = '#{ database.escape(body.username) }'", (err, rows) ->
		return callback(null, false) if rows.length != 0
		userModel.generatePass(body.password, (err, password) ->
			authkey = userModel.generateAuthkey(body.username)

			database.query("INSERT INTO users (username, email, password, authkey) VALUES ('#{ database.escape(body.username) }', '#{ database.escape(body.email) }', '#{ password }', '#{ database.escape(authkey) }')", (err, rows) ->
				return callback(null, { status: false}) if err

				sessionid = "#{ rows.insertId }, #{ authkey }"

				callback(null, { status: true, authkey: sessionid, user: rows.insertId})
			)
		)
	)

