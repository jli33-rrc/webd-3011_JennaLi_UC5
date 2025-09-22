class ProductsController < ApplicationController
  def index
    # Part 1, Step 13
    # @products = Product.all

    # Part 2, Step 9
    @products = Product.includes(:category).all
  end

  def show
    # Part 1, Step 17
    @product = Product.find(params[:id])
  end
end
