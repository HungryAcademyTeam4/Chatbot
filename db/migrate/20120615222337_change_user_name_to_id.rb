class ChangeUserNameToId < ActiveRecord::Migration
  def change
    rename_column :permissions, :user_name, :user_id
  end
end
