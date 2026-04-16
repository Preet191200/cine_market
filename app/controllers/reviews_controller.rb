class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: "Review added successfully!"
    else
      redirect_to product_path(@product), alert: @review.errors.full_messages.join(", ")
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @product = @review.product
    @review.destroy
    redirect_to product_path(@product), notice: "Review removed."
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
