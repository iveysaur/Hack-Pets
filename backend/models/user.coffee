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
