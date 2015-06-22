class CartsController < ApplicationController
  
 before_filter :index
  
  def index
    @carts = Cart.all
      @count = cart_count
  end
  
  def item
  
  end
  
  def show 
    @cart = current_cart
  end 

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
  end

  def update
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end
  
  def checkout
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_url("Your cart is empty")
    else
      @order = Order.new
    end
  end
  
  private
  
  def cart_params
      params.require(:cart).permit(:purchased_at)
  end
end


