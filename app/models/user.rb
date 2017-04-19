class User < ApplicationRecord

  has_one :profile
  has_many :friendships
  has_many :friends, through: :friendships

  before_save :capitalize_name

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
