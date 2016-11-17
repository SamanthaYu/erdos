json.extract! private_chat, :id, :user_id, :chatroom_id, :created_at, :updated_at
json.url private_chat_url(private_chat, format: :json)