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
    unless chat_room.nil? || chat_room.permissions.blank?
      chat_room.uninvite(params["permission"]["user_id"])
      render json: true, status: 201
    end
  end
end
