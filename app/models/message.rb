class Message < ActiveRecord::Base
  attr_accessible :content, :chat_room_id, :user_name, :user_id
  belongs_to :chat_room
  after_create :broadcast_to_specific_channel
  validates_presence_of :content, :chat_room_id

  def contents_hash
    { 'content'      => self.content,
      'user_id'      => self.user_id,
      'created_at'   => self.created_at,
      'id'           => self.id,
      'user_name'    => self.user_name,
      'chat_room_id' => self.chat_room_id }
  end

  def broadcast_to_specific_channel
    url = "http://localhost:9000/faye"
    message = { channel: "/#{self.chat_room_id}", data: contents_hash }
    Net::HTTP.post_form(URI.parse(url), message: message.to_json)
  end
end
