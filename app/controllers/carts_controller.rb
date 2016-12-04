class CartsController < ApplicationController
  def create
    authenticate_user!

    product = Product.find( params[:product_id] )
    cart = product.carts.build( cart_params )

    # 将当前的购物车cart的所有者设置为current_user
    cart.user = current_user

    item_in_cart = product.carts.where(user_id: cart.user_id).take

    if item_in_cart.nil?
      cart_to_save = cart
    else
      item_in_cart[:goods_amount] += cart.goods_amount
      cart_to_save = item_in_cart
    end 

    if cart_to_save.save
      redirect_to show_cart_path
    else
      alert = "Adding to Cart Failed"
      redirect_to root_path
    end

  end

  def show_cart
    # @cart_items = current_user.carts
  end

  def create_order_item
    params[:user][:cart].each do |id, amount_value|
      cart_item = Cart.find(id)
      cart_item.goods_amount = amount_value[:goods_amount]

      cart_item.save
    end
    
    redirect_to jiesuan_path
  end

  def jiesuan
    
  end

  private

    def cart_params
      params.require(:cart).permit(:goods_amount)
    end
end
