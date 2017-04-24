class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find(params[:user_id])
    @reviews = user.liked_reviews

    render 'reviews/index'
  end

  def create
    review = Review.find(params[:review_id])

    if cannot? :like, review
      redirect_to(
        product_path(review),
        alert: 'Liking your own review is sad 😥'
      )
      return # early return to prevent execution of anything
      # after the redirect above
    end

    like = Like.new(user: current_user, review: review)

    if like.save
      redirect_to product_path(review.product), notice: 'Liked review! ❤️'
    else
      redirect_to product_path(review.product), alert: like.errors.full_messages.join(', ')
    end
  end

  def destroy
    like = Like.find(params[:id])
    product = Product.find(params[:product_id])

    if cannot? :like, like.review
      redirect_to(
        product_path(product),
        alert: 'Un-liking your own review is prepostrous 😡'
      )
      return # early return to prevent execution of anything
      # after the redirect above
    end

    if like.destroy
      redirect_to product_path(product), notice: 'Un-liked review! 💔'
    else
      redirect_to product_path(product), alert: like.errors.full_messages.join(', ')
    end
  end
end
