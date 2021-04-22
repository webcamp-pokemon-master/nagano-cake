class DeliveryAddress < ApplicationRecord
  belongs_to :customer
  validates :customer_id, :name, :address, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  
  def nameaddress
    self.name + self.address + self.postal_code
    # @delivery_addresses = DeliveryAddress.where(customer: current_customer)
    # @delivery_addresses.name
  end
end

# book.name
# book=レシーバー
