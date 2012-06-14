class ChangeUserIdToStringField < ActiveRecord::Migration
  def change
    change_column :messages, :user_id, :string
    change_column :chat_rooms, :user_id, :string
  end
end
