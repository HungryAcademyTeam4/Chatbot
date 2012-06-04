class Message < ActiveRecord::Base
  attr_accessible :content, :chat_room_id
  belongs_to :chat_room
end
