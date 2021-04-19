class Product < ApplicationRecord
  attachment :image
  has_many :genres
  has_many :cart_items, dependent: :destroy
end
