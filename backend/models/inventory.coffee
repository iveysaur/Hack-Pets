database = require('../database')

exports.addItem = (user_id, item_id, callback) ->
	database.query "INSERT INTO inventory (item_id, owner_id) VALUES (" + ~~item_id + ", " + ~~user_id + ")", callback

exports.removeItem = (user_id, item_id, callback) ->
	database.query "DELETE FROM inventory WHERE item_id = " + ~~item_id + " AND owner_id = " + ~~user_id + " LIMIT 1", callback

exports.get = (user_id, callback) ->
	database.query "SELECT * FROM inventory WHERE owner_id = " + ~~user_id, callback

