class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :dislikes
  has_many :comments

  has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumbnail: "150x150"}, default_url: "images/no_user_logo.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
