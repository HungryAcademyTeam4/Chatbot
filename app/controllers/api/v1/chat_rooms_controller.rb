class Api::V1::ChatRoomsController < Api::V1::ApiController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    title = JSON.parse(params["chat_room"])
    chat_room = ChatRoom.create(title: title)
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