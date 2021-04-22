class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum making_status: {cannot_create: 0, waiting_create: 1, in_production: 2, completed: 3}

end
