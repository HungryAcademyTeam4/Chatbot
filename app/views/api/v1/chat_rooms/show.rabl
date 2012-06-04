object @chat_room
attributes :id, :title
child :messages do
  attributes :id, :content
end