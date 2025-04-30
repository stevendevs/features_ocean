class Message < ApplicationRecord
  belongs_to :chat
after_create_commit :broadcast_new_message

def broadcast_new_message
broadcast_prepend_to(chat, :messages, target: "chat-message", particial: "messages/message", locals: { message: self})
end


end
