class MessagesController < ApplicationController
  def create
    chat_room = ChatRoom.find(params[:message][:chat_room_id])
    @message = chat_room.messages.new(params[:message])
    respond_to do |format|
      if @message.save
        format.js
        format.html { redirect_to chat_room_path(chat_room) }
      else
        format.html {render action: "new" }
      end
    end
  end
end
