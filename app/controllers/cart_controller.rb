class CartController < ApplicationController
  def show
    @cart = session[:cart] || {}
    @cart_items = @cart.map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next if product.nil?
      { product: product, quantity: quantity }
    end.compact
    @total = @cart_items.sum { |item| item[:product].price * item[:quantity] }
  end

  def add
    @cart = session[:cart] || {}
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    quantity = 1 if quantity < 1

    if @cart[product_id]
      @cart[product_id] += quantity
    else
      @cart[product_id] = quantity
    end

    session[:cart] = @cart
    redirect_to cart_path, notice: "Item added to cart!"
  end

  def update
    @cart = session[:cart] || {}
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i

    if quantity <= 0
      @cart.delete(product_id)
    else
      @cart[product_id] = quantity
    end

    session[:cart] = @cart
    redirect_to cart_path, notice: "Cart updated!"
  end

  def remove
    @cart = session[:cart] || {}
    @cart.delete(params[:product_id].to_s)
    session[:cart] = @cart
    redirect_to cart_path, notice: "Item removed from cart."
  end
end
