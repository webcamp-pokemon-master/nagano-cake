class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  enum making_status: {waiting_for_payment: 0, confirm_payment: 1,under_construction: 2, ready_to_ship: 3, shipped: 4}

end
