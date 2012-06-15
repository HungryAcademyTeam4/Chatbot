object @chat_room
attributes :id, :title, :created_at, :locked
attribute  :user_id => :room_creator_id
attribute  :user_name => :room_creator_name
node :permissions_count do |chat_room|
  chat_room.permissions.count
end
child :messages do
  attributes :id, :user_id, :content, :created_at, :chat_room_id, :user_name
end


