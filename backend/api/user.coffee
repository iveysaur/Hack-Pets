bcrypt = require('bcryptjs')

database = require('../database')
userModel = require('../models/user.coffee')

exports.public_post_signup = (req, body, callback) ->
	database.query("SELECT username FROM users WHERE username = '#{ database.escape(body.username) }'", (err, rows) ->
		return callback(null, false) if rows.length != 0
		userModel.generatePass(body.password, (err, password) ->
			authkey = userModel.generateAuthkey(body.username)

			database.query("INSERT INTO users (username, email, password, authkey, created, points) VALUES ('#{ database.escape(body.username) }', '#{ database.escape(body.email) }', '#{ password }', '#{ database.escape(authkey) }', '#{ new Date().getTime() / 1000 }', '0')", (err, rows) ->
				return callback(null, { status: false}) if err

				sessionid = "#{ rows.insertId },#{ authkey }"

				callback(null, { status: true, authkey: sessionid, user: rows.insertId }, { "Access-Control-Allow-Credentials": "true", "Set-Cookie": "D=#{ sessionid }; Path=/; Expires=Wed, 09 Jun 2021 10:18:14 GMT", "Cache-Control": "no-cache" })
			)
		)
	)

exports.public_post_signin = (req, body, callback) ->
	database.query("SELECT id, password, authkey FROM users WHERE username = '#{ database.escape(body.username) }'", (err, rows) ->
		return callback(null, { status: false }) if not rows[0] or not rows[0].password
		bcrypt.compare(body.password, rows[0].password, (err, match) ->
			return callback(null, { status: false}) if err or not match
			sessionid = "#{ rows[0].id },#{ rows[0].authkey }"
			callback(null, { status: true, authkey: sessionid, user: rows[0].id }, { "Access-Control-Allow-Credentials": "true", "Set-Cookie": "D=#{ sessionid }; Path=/; Expires=Wed, 09 Jun 2021 10:18:14 GMT", "Cache-Control": "no-cache" }
			)
		)
	)

exports.get_info = (req, body, callback) ->
	user =
		name: req.userobj.username
		created: req.userobj.created
	callback(null, user)

exports.get_points = (req, body, callback) ->
	callback(null, req.userobj.points)

exports.public_get_signoff = (req, body, callback) ->
		callback(null, { status: true }, { "Access-Control-Allow-Credentials": "true", "Set-Cookie": "D=; Path=/; Expires=Wed, 09 Jun 2021 10:18:14 GMT", "Cache-Control": "no-cache" })
