class ChangeUserStatusOfCustomers < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :user_status, :boolean, default: true
  end
  
  def down
    change_column :customers, :user_status, :boolean
  end
end
