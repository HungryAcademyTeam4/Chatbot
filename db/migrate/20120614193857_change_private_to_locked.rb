class ChangePrivateToLocked < ActiveRecord::Migration
  def change
    rename_column :chat_rooms, :private, :locked
  end
end
