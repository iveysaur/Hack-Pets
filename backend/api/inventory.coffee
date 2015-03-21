inventory = require('../models/inventory')

exports.get_list = (req, body, callback) ->
	inventory.get req.userobj.id, callback

