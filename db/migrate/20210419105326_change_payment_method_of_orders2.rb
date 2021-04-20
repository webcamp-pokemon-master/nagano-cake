class ChangePaymentMethodOfOrders2 < ActiveRecord::Migration[5.2]
  def up 
    change_column :orders, :payment_method, :integer, default: 0
  end
  
  def down
    change_column :orders, :payment_method, :integer, default: 1
  end 
end
