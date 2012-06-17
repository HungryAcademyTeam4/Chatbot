class ChangeUserIdToUserName < ActiveRecord::Migration
  def change
    rename_column :permissions, :user_id, :user_name
  end
end
