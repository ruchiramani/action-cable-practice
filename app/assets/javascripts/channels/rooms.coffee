jQuery(document).on 'turbolinks:load', ->
  messages = $("#messages")
  if $('#messages').length > 0 
App.global_chat = App.cable.subsriptions.create {
  channel: "ChatRoomsChannel"
  chat_room_id: ''
},
connected: ->
disconnected: ->
received: ->
send_message: (message, chat_room_id) ->
  @perform 'send message', message: message, chat_room_id: chat_room_id
