class AddCardToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :card_number, :integer
    add_column :orders, :card_code, :integer
    add_column :orders, :card_month, :date
  end
end
