class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

<<<<<<< HEAD
  enum making_status: {"着手不可": 0, "制作待ち": 1,"制作中": 2, "制作完了": 3}
=======
  enum making_status: {cannot_create: 0, waiting_create: 1, in_production: 2, completed: 3}
>>>>>>> origin/develop

end
