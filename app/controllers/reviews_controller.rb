class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    review_params = params.require(:review).permit(:body, :rating)
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user

    if @review.save
      ReviewMailer.notify_product_review(@review).deliver_now
      redirect_to product_path(@product), notice: 'Review Created!'
    else
      render '/products/show'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to product_path(review.product), notice: 'Review deleted!'
  end
end
