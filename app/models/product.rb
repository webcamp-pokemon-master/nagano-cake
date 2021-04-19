class Product < ApplicationRecord
  attachment :image
  has_many :genres
  has_many :cart_items, dependent: :destroy

  # validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true

end
