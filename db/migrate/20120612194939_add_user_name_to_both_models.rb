class AddUserNameToBothModels < ActiveRecord::Migration
  def change
    add_column :chat_rooms, :user_name, :string
    add_column :messages, :user_name, :string
  end
end
