config = require('./config')
mysql = require('mysql-libmysqlclient')

connection = null
isConnecting = false

exports.init = ->
	return if isConnecting
	isConnecting = true

	db = config.database

	connection = mysql.createConnectionSync()
	connection.connectSync(db.host, db.user, db.password, db.database)

	if !connection.connectedSync()
		console.log "Problem connecting to the database"

	console.log "Connected!"
	isConnecting = false

exports.query = (query, callback, args) ->
	try
		connection.query(query, (err, res) ->
			if err
				console.log err
				exports.init()
				exports.query(query, callback)
				return
			if res.fetchAll
				res.fetchAll((err, res) ->
					callback(err, res, args)
				)
			else if callback
				callback(err, res, args)
		)
	catch e
		console.log e.message
		if e.message.indexOf "Not connected" != -1
			exports.init()
			setTimeout(() ->
				exports.query(query, callback)
			, 1000)

exports.escape = (string) ->
	connection.escapeSync(string)

