class Api::V1::MessagesController < Api::V1::ApiController
  TOKEN = "ruby_jobs"

  def index
    @messages = Message.all
  end

  def create
    #need to add user_id into message hash
    params["message"]["user_id"] = params["user_id"]
    parent_room = ChatRoom.find_by_id(params["chat_room_id"])
    if parent_room.permits?(params["user_id"]) || params["token"] == TOKEN
      message = Message.create(params["message"])
      if message.save
        return render nothing: true, status: 201
      else
        return render json: true, status: 406
      end
    else
      return render nothing: true, status: 406
    end
  end

  def show
    @message = Message.find(params[:id])
  end
end

