class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :fname
      t.string :lname
      t.text :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country

      t.timestamps
    end
  end
end
