class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:total, :card_holder_name, :order_number])
    flash[:notice] = "Order Created Successfully."
  end

  def update
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end
  
  def save_order
    @cart = current_cart
    @order = Order.new(order_params)
    @order.add_items_from_cart(@cart)
    @order.user_id = current_user.id
    if @order.save
   LineItem.destroy_all("cart_id = #{current_cart.id}")
     #redirect_to root_url
      redirect_to(:action =>'show', :id => @order.id)
      
require 'net/smtp'
require 'fileutils'
require 'rubygems'
require 'base64'


message = <<MESSAGE_END
From: nerella244@gmail.com
To: A Test User 
MIME-Version: 1.0
Content-type: text/html
Subject: Online Book Store


<h1> You have succesfully placed your order <h1>
<table align='center' border="1">
  <tr>
    <th>Product</th>
    <th>Qty</th>
    <th >Unit Price</th>
    <th>Full Price</th>
    
  </tr>
  
   #for line_item in @order.line_items
   @order.each do |line_item|
    <tr>
    <td > image_tag line_item.book.image.url, :size => "40x40" %>
      <!-- link_to line_item.book.title, book_path(line_item.book)%></td> -->   
       <td> line_item.book.title</td>
      <td>  line_item.quantity</td>
      <td > number_to_currency(line_item.unit_price)</td>
      <td > number_to_currency(line_item.full_price)</td>
     </tr>
     
  end
  <td>
      Total: number_to_currency #{@order.total_price}
    </td>
</table>

MESSAGE_END


smtp = Net::SMTP.new('smtp.gmail.com', 587 )
smtp.enable_starttls
smtp.start('gmail.com', 'nerella244@gmail.com', 'Mahesh123#', :login) do |smtp|
        smtp.send_message message  , 'nerella244@gmail.com' , current_user.email
end
    else
      redirect_to(:controller =>'carts', :action => 'checkout')
    end
  end
  
  def order_list
  if !admin_signed_in?
@order=Order.where(:user_id => current_user.id).all
 else
   @order =Order.all
 end
  end
  
  
  
  private
  
  def order_params
      params.require(:order).permit(:fname, :lname, :address, :city, :state, :zipcode ,:country, :user_id,:card_number,:card_code, :month,:year)
  end
end
