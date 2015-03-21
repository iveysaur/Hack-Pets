shops = {}
shops["whimsical"] = require("../shops/whimsical")

userModel = require("../models/user")

exports.get_list = (req, body, callback) ->
	shop = req.args[2]
	i = shops[shop].items.length

	while shops[shop].items.length < shops[shop].max_items
		shops[shop].items.push {
			id: i
			item_id: Math.floor(Math.random() * 3)
			price: Math.round(Math.random() * 4000)
		}
	callback null, shops[shop]

exports.get_buy = (req, body, callback) ->
	shop = req.args[2]
	id = ~~req.args[3]
	i = 0
	for item in shops[shop].items
		if item.id == id
			if req.userobj.points < item.price
				return callback null, false
			req.userobj.points -= item.price
			userModel.updateUser req.userobj
			shops[shop].items.splice i, 1
			break
		i++
	callback null, true
