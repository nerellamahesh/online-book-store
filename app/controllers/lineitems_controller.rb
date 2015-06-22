class LineitemsController < ApplicationController
  
  def index
    @line_items = LineItem.all
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
   @book = Book.find(params[:book_id])
    if LineItem.exists?(:cart_id => current_cart.id, :book_id => @book.id)
     
      item = LineItem.find(:first, :conditions => [ "cart_id = #{current_cart.id} AND book_id = #{@book.id}" ])
      LineItem.update(item.id, :quantity => item.quantity + 1)
    else  
     @line_item = LineItem.create!(:cart => current_cart, :book => @book, :quantity => 1, :unit_price => @book.price)
     flash[:notice] = "Added #{@book.title} to cart."
    end
  redirect_to carts_show_path
  end
  
  def delete
    
    @book = Book.find(params[:book_id])
    if LineItem.exists?(:cart_id => current_cart.id, :book_id => @book.id)
     
     #LineItem.where (:cart_id => current_cart.id  AND :book_id => @book.id).destroy_all
    
    item = LineItem.find(:first, :conditions => [ "cart_id = #{current_cart.id} AND book_id = #{@book.id}" ])
     item.destroy 
    #LineItem.update(item.id, :quantity => item.quantity + 1)
    else  
     @line_item = LineItem.create!(:cart => current_cart, :book => @book, :quantity => 1, :unit_price => @book.price)
     flash[:notice] = "Added #{@book.title} to cart."
    end
  redirect_to carts_show_path
    
end
  

  def decrement
    @book = Book.find(params[:book_id])
     
    
    if LineItem.exists?(:cart_id => current_cart.id, :book_id => @book.id)
     #current_cart.LineItems.find(:first, :conditions => {:book_id => @book.id}).increment! :quantiry
      item = LineItem.find(:first, :conditions => [ "cart_id = #{current_cart.id} AND book_id = #{@book.id}" ])
      if item.quantity <=1 
         #@line_item = LineItem.find(params[:book_id])
         # @line_item.destroy
      else
        LineItem.update(item.id, :quantity => item.quantity - 1)
      end
    else  
     @line_item = LineItem.create!(:cart => current_cart, :book => @book, :quantity => 1, :unit_price => @book.price)
     flash[:notice] = "Added #{@book.title} to cart."
    end
    redirect_to carts_show_path
   
  end
  

  def update
    @line_item = LineItem.find(params[:id])
  end

  def destroy
    @line_item = LineItem.destroy_all("cart_id = #{current_cart.id}")
   redirect_to carts_show_path
  end
end
