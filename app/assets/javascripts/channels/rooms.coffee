jQuery(document).on 'turbolinks:load', ->
  messages = $("#messages")
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
    messages_to_bottom()

  App.global_chat = App.cable.subsriptions.create {
    channel: "ChatRoomsChannel"
    chat_room_id: ''
  },
  connected: ->
  disconnected: ->
  received: (data) ->
    messages.append data['message']
  send_message: (message, chat_room_id) ->
    @perform 'send message', message: message, chat_room_id: chat_room_id

  $("#new_message").submit(e) ->
    $this = $(this)
    textarea = $this.find("message_body")
    if $.trim(textarea.val()).length >1
      App.global_chat.send_message textarea.val(), messages.data('chat_room-id')
      textarea.val('')
    e.preventDefualt()
    return false
