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
      console.log "hello!"
      callback
        image: {
          src: "img/bacon.jpg",
          alt: "Bacon!"
        },
        description: "You approach the bacon and wait for the server to respond. Get it? Server? Hah. You got a " + Math.random()
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

