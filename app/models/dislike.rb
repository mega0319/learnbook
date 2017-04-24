class Dislike < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :user_id, uniqueness: { scope: :post_id,
    message: "You already disliked this post! Chill on the haterade." }
end
