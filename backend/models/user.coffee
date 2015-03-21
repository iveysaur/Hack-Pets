bcrypt = require('bcryptjs')
crypto = require('crypto')

database = require('../database')

exports.verifyAuth = (userid, authkey, callback) ->
	this.getUser(userid, (err, rows) ->
		console.log "authkey: " + authkey + " expected " + rows[0].authkey
		return callback(false) if err or rows.length < 1 or not rows[0]
		callback(authkey == rows[0].authkey, rows[0])
	)

exports.getUser = (userid, callback) ->
	database.query("SELECT * FROM users WHERE id = #{ ~~(userid) }", callback)

exports.generatePass = (password, callback) ->
	bcrypt.hash(password, 11, callback)

exports.generateAuthkey = (user) ->
	user.toString() + crypto.randomBytes(20).toString("hex")

exports.updateUser = (user) ->
	setString = []
	for prop of user
		console.log prop
		console.log user[prop]
		console.log typeof(user[prop])
		if typeof(user[prop]) == "number"
			setString.push database.escape(prop) + " = " + ~~user[prop]
		else
			setString.push database.escape(prop) + " = \"" + database.escape(user[prop].toString()) + "\""
	setString = setString.join(",")

	query = "UPDATE users SET " + setString + " WHERE id = " + ~~user.id
	database.query(query)
