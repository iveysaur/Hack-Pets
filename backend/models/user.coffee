bcrypt = require('bcryptjs')
crypto = require('crypto')

exports.generatePass = (password, callback) ->
	bcrypt.hash(password, 11, callback)

exports.generateAuthkey = (user) ->
	user.toString() + crypto.randomBytes(20).toString("hex")
