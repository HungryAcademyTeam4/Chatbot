class AddUserIdToRoom < ActiveRecord::Migration
  def change
    add_column :chat_rooms, :user_id, :integer
    add_column :messages, :user_id, :integer
  end
end
