class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :firstname, :lastname, :dob,:email,:phone, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:log_in) { |u| u.permit(:username,:password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :firstname, :lastname, :dob,:email,:phone, :password, :password_confirmation, :current_password) }
  end
  
  
  def current_cart
    #cookies.signed[:user_id]= current_user.id
    #@current_cart ||= Cart.find(cookies.signed[:user_id])
    
   #session[:cart_id] ||= Cart.create!.id
   #@current_cart ||= Cart.find(session[:cart_id])
   
   if current_user
    
    #@current_cart = Cart.find(:conditions => [ ":user_id = #{current_user.id}"])
    @current_cart=Cart.where(:user_id => current_user.id).take
   
      if @current_cart
         return @current_cart
      else
         @current_cart = Cart.create(:user_id => current_user.id )
         return @current_cart
      end
   
   else
      @current_cart = nil
   end
   
  end
  
  def current_user_id
  id = current_user.id
  id
  end
 # def save_order
  #  @cart = current_cart
   # @order = Order.new(params[:order])
    #@order.add_line_items_from_Cart(@cart)
    #if @order.save
     # redirect_to_root("Thank you for your order")
    #else
     # render :action => 'checkout'
    #end
    

  #end
  
  def cart_count
    if current_user
      @cart = current_cart
    
      @line_items = LineItem.all
      @count = 0
      @line_items.each do |item|
       if (item.cart_id == @cart.id)
         @count += item.quantity
       end
      end
    return @count
    end
  end
  
  
  
  def cart_total
    if user_signed_in?
    @cart = current_cart
    @total =@cart.total_price
   
      return @total 
 end
  end
  
  

end
   