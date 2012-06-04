Chatbot::Application.routes.draw do
  root to: "chat_rooms#index"

  resources :chat_rooms
  resources :messages

end
