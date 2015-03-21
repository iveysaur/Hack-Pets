userModel = require('../models/user')

exports.post_win = (req, body, callback) ->
	req.userobj.points += body.points
	userModel.updateUser req.userobj
	callback null, true

