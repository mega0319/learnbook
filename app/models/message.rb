class Message < ApplicationRecord
  has_one :sent_message
  has_one :received_message
end
