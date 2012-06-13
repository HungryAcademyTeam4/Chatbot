class Api::V1::MessagesController < Api::V1::ApiController
  def index
    @messages = Message.all
  end

  def create
    message = Message.create(params["message"])
    if message.save
      render json: true, status: 201
    else
      render json: true, status: 406
    end
  end

  def show
    @message = Message.find(params[:id])
  end
end

