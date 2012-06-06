class Api::V1::ChatRoomsController < Api::V1::ApiController
  def index
    @chat_rooms = ChatRoom.all
  end

  def create
    chat_room = ChatRoom.create(params["chat_room"])
    if chat_room.save
      render json: true, status: 201
    else
      render json: true, status: 406
    end
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end
end