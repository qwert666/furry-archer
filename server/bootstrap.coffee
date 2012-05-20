_.extend Meteor.Collection.prototype,
  restrict_client_access: (methods) ->
    self = this;
    methods = ['insert','update','remove'] if _.isEmpty methods
    methods = [methods] if _.isString methods
    _.each methods, (method) ->
      Meteor.default_server.method_handlers[self._prefix + method] = ->
        console.log "restricting #{method} on #{self._prefix} collection"

Meteor.startup ->
  if Rooms.find().count() == 0
    Rooms.insert
      name: "Chatroom",
      description: "I jego wlasny opis"
      open: true
      messages_count: 0
      last_message_at: null
