class ProductsController < ApplicationController
  def show
    @product = Product.find( params[:id] )
    @cart = @product.carts.build
  end
end