class Api::V1::ApiController < ActionController::Base
  # before_filter :require_chat_token
  respond_to :json

  private

  # def chat_token
  #   "5b5cd0da3121fc53b4bc84d0c8af2e81"
  # end

  # def require_chat_token
  #   unless params[:token] == chat_token
  #     respond_with do |format|
  #       error = {error: "Invalid chat token."}
  #       format.json { render json: error, status: 401 }
  #     end
  #   end
  # end

end