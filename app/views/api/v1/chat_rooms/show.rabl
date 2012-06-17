object @chat_room
attributes :id, :title, :created_at, :locked
attribute  :user_id
attribute  :user_name

node :permissions_count do |chat_room|
  chat_room.permissions.count
end

child :permissions do |chat_room|
  attributes :user_id
end

child :messages do
  attributes :id, :user_id, :content, :created_at, :chat_room_id, :user_name
end


