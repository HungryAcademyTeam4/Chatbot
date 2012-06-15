class Permission < ActiveRecord::Base
  attr_accessible :chat_room_id, :user_id
  belongs_to :chat_room
end
