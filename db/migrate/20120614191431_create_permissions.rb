class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :user_id
      t.integer :chat_room_id

      t.timestamps
    end
  end
end
