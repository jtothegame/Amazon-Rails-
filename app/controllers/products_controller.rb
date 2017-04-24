class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    @product.user = current_user
    if @product.save

      ProductMailer.notify_product_owner(@product).deliver_now
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @review.product = @product
  end

  def index
    @products = Product.last(20)
  end

  def destroy
    product = Product.find params[:id]
    if can? :destroy, @product
      @product.destroy
      redirect_to products_path, notice: 'Product Deleted'
    else
      redirect_to root_path, alert: 'Access Denied'
    end
  end

  def update
    @product = Product.find params[:id]
    product_params = params.require(:product).permit([:title, :description, :price, :category_id])

    if !(can? :edit, @product)
      redirect_to root_path, alert: 'access denied'
    elsif @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product updated'
    else
      render :edit
    end
  end

  def edit
    redirect_to root_path, alert: 'access denied' unless can? :edit, @product
  end

  private

  def find_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit([:title, :description, :price, :category_id, { tag_ids: [] } ])
  end
end
