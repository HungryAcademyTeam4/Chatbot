Chatbot::Application.routes.draw do
  root to: "chat_rooms#index"

  resources :chat_rooms
  resources :messages

  namespace :api do
    namespace :v1 do
      resources :chat_rooms
      resources :messages
      resources :permissions, only: [:create, :destroy, :show]
    end
  end

end
