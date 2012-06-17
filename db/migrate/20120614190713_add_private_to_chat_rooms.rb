class AddPrivateToChatRooms < ActiveRecord::Migration
  def change
    add_column :chat_rooms, :private, :boolean, default: false
  end
end
