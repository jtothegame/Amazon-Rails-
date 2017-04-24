class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review

  # the following validation guarantees that the user can only like a review once.
  validates :user_id, uniqueness: { scope: :review_id }
end
