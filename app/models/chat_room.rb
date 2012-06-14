class ChatRoom < ActiveRecord::Base
  attr_accessible :title, :user_id, :user_name, :locked
  has_many :messages
  has_many :permissions

  validates_presence_of :title#, :user_id

  def invite(user_id)
    self.permissions.create(user_id: user_id, chat_room_id: self.id)
  end

  def uninvite(user_id)
    self.permissions.find_by_user_id(user_id).destroy
  end

  def permits?(user_id)
    true if self.permissions.find_by_user_id(user_id)
  end

  def unlocked
    !locked
  end

end
