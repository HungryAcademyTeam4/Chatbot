class Message < ActiveRecord::Base
  attr_accessible :content, :chat_room_id
  belongs_to :chat_room
  after_create :broadcast
  validates_presence_of :content, :chat_room_id

  def broadcast
    url = "http://fallinggarden.com:9000/faye"
    message = { channel: "/#{self.chat_room_id}", data: { 'content' => self.content, 'user_id' => self.user_id, 'created_at' => self.created_at } }
    Net::HTTP.post_form(URI.parse(url), message: message.to_json)
  end
end
