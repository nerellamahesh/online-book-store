class AddMonthToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :month, :integer
    add_column :orders, :year, :integer
  end
end
