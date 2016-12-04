class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "product has been created."
      redirect_to [ :admin, @product ]
    else
      flash.now[:alert] = "product has not been created."
      render "new"
    end
  end

  def show
    @product = Product.find( params[:id] )
  end

  private

    def product_params
      params.require( :product ).permit( :name, :price )
    end
end
