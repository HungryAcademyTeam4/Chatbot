object @chat_room
attributes :id, :title
attribute  :user_id => :room_creator
child :messages do
  attributes :id, :user_id, :content
end