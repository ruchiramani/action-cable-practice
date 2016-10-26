class ChatRoomChannel < ApplicationCable::channel
  def subscribed
    stream_from "chat_room_#{params[chat_room_id]}_channel"
  end

  def unsubscribed
  end

  def send_message(data)
  end
end
