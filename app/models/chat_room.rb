class ChatRoom < ActiveRecord::Base
  attr_accessible :title, :user_id
  has_many :messages

  validates_presence_of :title, :user_id

end
