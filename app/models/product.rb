class Product < ApplicationRecord
  attachment :image
  has_many :genres
end
