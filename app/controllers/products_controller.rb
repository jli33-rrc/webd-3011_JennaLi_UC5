class ProductsController < ApplicationController
  def index
    # Part 1, Step 13
    @products = Product.all
  end
end
