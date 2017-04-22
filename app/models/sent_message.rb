class SentMessage < ActiveRecord::Base
  belongs_to :message
  belongs_to :user, foreign_key: "user_sent"

end
