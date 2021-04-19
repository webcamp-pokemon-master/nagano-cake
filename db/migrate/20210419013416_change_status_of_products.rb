class ChangeStatusOfProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :status, :boolean, default: 'true'
  end

  def down
    change_column :products, :status, :boolean
  end
end
