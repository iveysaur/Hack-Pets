inventory = require('../models/inventory')

module.exports = (id, user, callback) ->
  if storyObject[id].hook
    storyObject[id].hook(user, callback)
  else
    callback storyObject[id]

storyObject = {
  0: {
    image: {
      src: "img/bacon.jpg",
      alt: "Bacon!"
    },
    description: "It's a giant omlete.",
    actions: [
      {
        text: "Eat some!",
        actionId: 1
      },
      {
        text: "Question the meaning of life.",
        actionId: 2
      },
    ]
  },
  1: {
    hook: (user, callback) ->
      inventory.addItem user.id, 1
      callback
        image: {
          src: "img/bacon.jpg",
          alt: "Bacon!"
        },
        description: "You approach the bacon. Mm, bacon."
        received_items: [1]
  },
  2: {
    image: {
      src: "img/bacon.jpg",
      alt: "Bacon!"
    },
    description: "It's just a mound of bacon, don't question it.",
    actions: [
      {
        text: "Eat some!",
        actionId: 1
      }
    ]
  }
}

