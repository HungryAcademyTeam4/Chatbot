object @chat_room
attributes :id, :title, :created_at
attribute  :user_id => :room_creator
child :messages do
  attributes :id, :user_id, :content, :created_at, :chat_room_id
end

