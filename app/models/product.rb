class Product < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_products
  # validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true,numericality: { only_integer: true }
  
  def price=(value)
    value.tr!('０-９', '0-9') if value.is_a?(String)
    super(value)
  end
  
  validates :genre_id, presence: true

  def self.search_for(content)
      Product.where("name LIKE?", "%#{content}%")
  end
  
end
