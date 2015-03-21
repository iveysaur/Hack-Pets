inventory = require('../models/inventory')

module.exports = (id, user, callback) ->
  if storyObject[id].hook
    storyObject[id].hook(user, callback)
  else
    callback storyObject[id]

storyObject = {
  0: {
    image: {
      src: "img/fairy.jpg",
      alt: "Fairy"
    },
    description: "Welcome to the cottage of the Great Fairy.",
    actions: [
      {
        text: "Request a blessing",
        actionId: 1
      },
      {
        text: "Take a chance for prizes",
        actionId: 2
      },
    ]
  },
  1: {
    hook: (user, callback) ->
      callback
        image: {
          src: "img/fairy.jpg",
          alt: "Fairy"
        },
        description: "You have been blessed."
  },
  2: {
    hook: (user, callback) ->
      result = {
        image: {
          src: "img/fairy.jpg",
          alt: "Fairy"
        }
      }
      if Math.random() > 0.5
        result.description = "You rotten fiend, reduce your demands!"
        result.actions = [{ text: "Run away!", href: "#/map/1" }]
      else
        inventory.addItem user.id, 2
        result.description = "Fortune smiles upon you, young traveler. Please accept this gift."
        result.received_items = [2]

      callback result
  }
}


