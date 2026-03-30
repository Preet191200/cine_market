class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_cart_not_empty

  def new
    @cart_items = build_cart_items
    @total      = @cart_items.sum { |i| i[:subtotal] }
    @provinces  = Province.order(:name)
    @address    = current_user.address || Address.new
  end

  def confirm
    @cart_items = build_cart_items
    @province   = Province.find(params[:province_id])
    @address    = params[:address]
    @subtotal   = @cart_items.sum { |i| i[:subtotal] }

    # Calculate taxes
    if @province.hst_rate > 0
      @hst       = (@subtotal * @province.hst_rate).round(2)
      @gst       = 0
      @pst       = 0
    else
      @gst       = (@subtotal * @province.gst_rate).round(2)
      @pst       = (@subtotal * @province.pst_rate).round(2)
      @hst       = 0
    end

    @tax_total = @gst + @pst + @hst
    @total     = @subtotal + @tax_total
  end

  def create
    @cart_items = build_cart_items
    @province   = Province.find(params[:province_id])
    @subtotal   = @cart_items.sum { |i| i[:subtotal] }

    if @province.hst_rate > 0
      @hst = (@subtotal * @province.hst_rate).round(2)
      @gst = 0
      @pst = 0
    else
      @gst = (@subtotal * @province.gst_rate).round(2)
      @pst = (@subtotal * @province.pst_rate).round(2)
      @hst = 0
    end

    @tax_total = @gst + @pst + @hst
    @total     = @subtotal + @tax_total

    # Save address
    address = current_user.address || current_user.build_address
    address.street      = params[:street]
    address.city        = params[:city]
    address.postal_code = params[:postal_code]
    address.province    = @province
    address.save

    # Create order
    order = Order.new(
      user:        current_user,
      total_price: @total,
      status:      "pending"
    )

    @cart_items.each do |item|
      tax_per_item = (item[:subtotal] * (@province.gst_rate + @province.pst_rate + @province.hst_rate)).round(2)
      order.order_items.build(
        product:           item[:product],
        quantity:          item[:quantity],
        price_at_purchase: item[:product].price,
        tax_at_purchase:   tax_per_item
      )
    end

    if order.save
      session[:cart] = {}
      redirect_to order_path(order), notice: "Order placed successfully!"
    else
      redirect_to checkout_path, alert: "Something went wrong. Please try again."
    end
  end

  private

  def build_cart_items
    cart = session[:cart] || {}
    cart.map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next if product.nil?
      { product: product, quantity: quantity, subtotal: product.price * quantity }
    end.compact
  end

  def ensure_cart_not_empty
    if session[:cart].blank?
      redirect_to cart_path, alert: "Your cart is empty."
    end
  end
end