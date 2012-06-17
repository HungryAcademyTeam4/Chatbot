class Api::V1::ChatRoomsController < Api::V1::ApiController
  def index
    unlocked_rooms = ChatRoom.where(locked: false)
    locked_rooms = ChatRoom.all.select { |room| room.permissions.find_by_user_id(params["user_id"]) }
    @chat_rooms = unlocked_rooms + locked_rooms
    @chat_rooms.uniq
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
    unless @chat_room.unlocked || @chat_room.permits?(params["user_id"])
      error = {error: "Do not have permission."}
      render json: error, status: 403
    end
  end

end