bcrypt = require('bcryptjs')

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

exports.signin = (req, body, callback) ->
	database.query("SELECT id, password, authkey FROM users WHERE username = '#{ database.escape(body.username) }'", (err, rows) ->
		return callback(null, { status: false }) if not rows[0] or not rows[0].password
		bcrypt.compare(body.password, rows[0].password, (err, match) ->
			return callback(null, { status: false}) if err or not match
			sessionid = "#{ rows[0].id }, #{ rows[0].authkey }"
			callback(null, { status: true, authkey: sessionid, user: rows[0].id }, { "Set-Cookie": "D=#{ sessionid }; Path=/; Expires=Wed, 09 Jun 2021 10:18:14 GMT", "Cache-Control": "no-cache" }
			)
		)
	)

