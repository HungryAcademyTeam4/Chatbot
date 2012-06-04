class AddChatRoomIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :chat_room_id, :integer
  end
end
