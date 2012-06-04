Chatbot::Application.routes.draw do
  root to: "chat_rooms#index"

  resources :chat_rooms
  resources :messages

  namespace :api do
    namespace :v1 do
      resources :chat_rooms, :messages
    end
  end

end
