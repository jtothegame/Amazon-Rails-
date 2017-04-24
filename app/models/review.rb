class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  has_many :likes, dependent: :destroy

  has_many :likers, through: :likes, source: :user

  validates :rating, inclusion: 1..5

  def liked_by(user)
    likes.exists?(user: user_id)
  end

  def liked_for(user)
    likes.find_by(user: user_id)
  end

end
