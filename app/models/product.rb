class Product < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_products
  # validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true,numericality: { only_integer: true }
  validates :genre_id, presence: true

end
