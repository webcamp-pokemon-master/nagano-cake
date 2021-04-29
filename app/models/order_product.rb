class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product



  enum making_status: {"着手不可": 0, "製作待ち": 1,"製作中": 2, "製作完了": 3}

  after_update do
    order_products = self.order.order_products #selfはorderproductsのこと(1行目)、self.orderのorderはbelongs_to :orderのorder
    if order_products.any? {|order_product| order_product.making_status == "製作中"} == true
      self.order.update(status: "製作中")
    elsif order_products.all? {|order_product| order_product.making_status == "製作完了"} == true
      self.order.update(status: "発送準備中")
    end
  end
#11.14行目の==trueは無くてもいい、if any?でtrueかfalseを返す


end
