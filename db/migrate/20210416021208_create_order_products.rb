class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|

      t.integer :product_id
      t.integer :order_id
      t.integer :amount
      t.integer :making_status
      t.integer :price

      t.timestamps
    end
  end
end
