Chatroom = {} unless Chatroom?

Chatroom.messagesForRoom = (room) ->
  Messages.find {room_id: room._id}, {sort: {timestamp: 1}}

Chatroom.preparePermalink = (name) ->
  name.replace(/[^a-z0-9]+/gi, '-').replace(/^-*|-*$/g, '').toLowerCase()
