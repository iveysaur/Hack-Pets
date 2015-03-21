npcs = {}
npcs["bacon"] = require("../npcs/bacon")
npcs["fairy"] = require("../npcs/prize-fairy")

exports.get_start = (req, body, callback) ->
	console.log npcs[req.args[2]]
	npcs[req.args[2]](0, req.userobj, (obj) -> callback(null, obj))

exports.get_action = (req, body, callback) ->
	console.log npcs[req.args[2]]
	npcs[req.args[2]](~~req.args[3], req.userobj, (obj) -> callback(null, obj))
