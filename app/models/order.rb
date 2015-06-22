class Order < ActiveRecord::Base
has_many :line_items

#validates_presence_of :fname, :lname, :address, :state, :city, :zipcode, :country

validates :fname, presence: true
validates :lname, presence: true
validates :address, presence: true
validates :state, presence: true
validates :city, presence: true
validates :zipcode, presence: true
validates :country, presence: true
validates :card_number, presence:true, length:{ is: 16, message:"card number must be 16 digit"}, :numericality => {:only_integer =>true}
validates :card_code, presence:true, length:{ is: 3, message:"card number CVV must be 3 digit"}, :numericality => {:only_integer =>true}
validates :month, presence:true
validates :year, presence:true
#validates :card_month, presence:true


def add_items_from_cart(cart)
  cart.line_items.each do |item|
  line_item = LineItem.from_cart_item(item)
  line_items << line_item
end
end

def total_price
	line_items.to_a.sum(&:full_price)
   end
end
