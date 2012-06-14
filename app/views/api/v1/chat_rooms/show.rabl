object @chat_room
attributes :id, :title, :created_at, :locked
attribute  :user_id => :room_creator_id
attribute  :user_name => :room_creator_name
child :permissions do
  attributes :user_id
end
child :messages do
  attributes :id, :user_id, :content, :created_at, :chat_room_id, :user_name
end


