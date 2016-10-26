class ChatRoomChannel < ApplicationCable::channel
  def subscribed
    stream_from "chat_room_#{params[chat_room_id]}_channel"
  end

  def unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data["chat_room_id"])
  end
end
