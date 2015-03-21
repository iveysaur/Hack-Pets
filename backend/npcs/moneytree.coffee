userModel = require('../models/user')

module.exports = (id, user, callback) ->
  if storyObject[id].hook
    storyObject[id].hook(user, callback)
  else
    callback storyObject[id]

storyObject = {
  0: {
    image: {
      src: "img/moneytree.jpg",
      alt: "Money Tree"
    },
    description: "I'm self-documented, what do you want?",
    actions: [
      {
        text: "Money",
        actionId: 1
      },
      {
        text: "Cash",
        actionId: 1
      },
      {
        text: "Dough",
        actionId: 1
      },
    ]
  },
  1: {
    hook: (user, callback) ->
      user.points += Math.round(Math.random() * 1000)
      userModel.updateUser user
      callback
        image: {
          src: "img/moneytree.jpg",
          alt: "Money Tree"
        },
        description: "Your wealth has increased slightly."
  }
}

