class ChatRoom < ActiveRecord::Base
  attr_accessible :title, :user_id
  has_many :messages

end
