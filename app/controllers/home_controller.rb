class HomeController < ApplicationController
  def index
    @products = Product.includes(:category).limit(8)
  end
end
