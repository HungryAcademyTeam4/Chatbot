class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    chat_room = ChatRoom.new(params[:chat_room])
    if chat_room.save
      redirect_to root_url, notice: "Successfully created #{chat_room.title} room "
    else
      render :new
    end
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    gon.chat_room = @chat_room
  end
end
