class Api::V1::PermissionsController < Api::V1::ApiController
  def create
    permission = Permission.new(params["permission"])
    if permission.save
      render json: true, status: 201
    else
      render json: true, status: 406
    end
  end

  def destroy
    chat_room = ChatRoom.find_by_id(params["permission"]["chat_room_id"])
    permission = chat_room.permissions.find_by_user_name(params["permission"]["user_name"])
    if permission.destroy
      render json: true, status: 201
    end
  end
end
