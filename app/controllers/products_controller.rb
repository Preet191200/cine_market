class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.includes(:category)

    if params[:query].present?
      @products = @products.where(
        "title ILIKE :q OR description ILIKE :q", q: "%#{params[:query]}%"
      )
    end

    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    @products = @products.all
  end

  def show
    @product = Product.find(params[:id])
  end
end