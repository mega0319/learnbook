class User < ApplicationRecord


  #friendships
  has_one :profile
  has_many :friendships
  has_many :friends, through: :friendships

  #friend_requests
  has_many :friend_requests
  has_many :senders, through: :friend_requests, source: :sender
  has_many :receivers, through: :friend_requests, source: :receiver

  #posts
  has_many :posts

  #likes
  has_many :likes

  #dislikes
  has_many :dislikes

  #comments
  has_many :comments

  #image
  has_attached_file :profile_pic, styles: { large: "600x600", medium: "300x300", thumbnail: "150x150#"}, default_url: "/images/no_user_logo.jpeg"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  #messages
  has_many :sent_messages, foreign_key: "user_sent"
  has_many :received_messages, foreign_key: "user_received"
  has_many :messages_received, through: :sent_messages, source: :messages
  #SELECT "messages".* FROM "messages" INNER JOIN "sent_messages" ON "messages"."id" = "sent_messages"."message_id" WHERE "sent_messages"."user_sent" = $1  [["user_sent", 7]]
  has_many :messages, through: :received_messages
  #SELECT "messages".* FROM "messages" INNER JOIN "received_messages" ON "messages"."id" = "received_messages"."message_id" WHERE "received_messages"."user_received" = $1  [["user_received", 7]]

  before_save :capitalize_name

  #validations
  validates :username, presence: true, uniqueness: true
  validates :username, length: { in: 6..12 }
  validates :password, length: { in: 6..12 }
  validates :email, presence: true, uniqueness: true
  validates_email_format_of :email, :message => 'is not a real e-mail bro!'
  validates :birthday, presence: true
  validates_date :birthday, :on_or_before => lambda { Date.current }
  has_secure_password


  def capitalize_name
    self.first_name = self.first_name.split.collect(&:capitalize).join(' ')
    self.last_name = self.last_name.split.collect(&:capitalize).join(' ')
  end


end
