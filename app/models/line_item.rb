class LineItem < ActiveRecord::Base
  
  belongs_to :book
  belongs_to :cart
  belongs_to :order

    def full_price
	unit_price * quantity
    end
    
    def self.from_cart_item(item)

    li = self.new
    li.book_id = item.book_id
    li.quantity = item.quantity
    li.unit_price =item.unit_price
    li
    end
end
