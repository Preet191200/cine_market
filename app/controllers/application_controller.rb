class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :cart_count

  def cart_count
    cart = session[:cart] || {}
    cart.values.sum
  end
end