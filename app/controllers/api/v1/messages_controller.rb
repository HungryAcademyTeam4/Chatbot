class Api::V1::MessagesController < Api::V1::ApiController
  def create
    message = Message.create(params["message"])
    if chat_room.save?
      render json: true, status: 201
    else
      render json: true, status: 406
    end
  end
end

