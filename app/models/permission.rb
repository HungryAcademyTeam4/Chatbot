class Permission < ActiveRecord::Base
  attr_accessible :chat_room_id, :user_name
  belongs_to :chat_room
end
