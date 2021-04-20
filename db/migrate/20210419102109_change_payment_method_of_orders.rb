class ChangePaymentMethodOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :payment_method, :integer, default: 1
  end

  def down
    change_column :orders, :payment_method, :integer
  end
  
  # change_column :テーブル名, :カラム名, :データ型, option
end
