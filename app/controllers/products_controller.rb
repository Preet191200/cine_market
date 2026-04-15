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

    case params[:filter]
    when "new"
      @products = @products.where("products.created_at >= ?", 3.days.ago)
    when "updated"
      @products = @products.where("products.updated_at >= ? AND products.created_at < ?", 3.days.ago, 3.days.ago)
    end

    @products = @products.page(params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
  end
end