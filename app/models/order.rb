class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy

  validates :postal_code, length: {is: 7}, numericality: {only_integer: true}
  validates :customer_id, :address, :name, :postage, :payment, :payment_method, presence: true
  validates :postage, :payment, numericality: {only_integer: true }


# 　反映テスト
  enum payment_method: {"クレジットカード": 0, "銀行振込": 1 }
  enum status: {"入金待ち": 0, "入金確認": 1,"製作中": 2, "発送準備中": 3, "発送済み": 4}

  # 元の値を確認したい場合は、
  # rails c →　order = Order(1) →　order.payment_method_before_type_cast で確認
  #参考 https://qiita.com/yusuke-matsuda/items/df05c8165e2f084023b0

  # enum_help 参照http://www.monokoto.xyz/enum-help-i18n/

  after_update do
    if self.status == "入金確認"
      self.order_products.each {|order_product|
      order_product.update(making_status: "製作待ち")
      }
    end
  end


  def sum_order_products
    self.order_products.inject(0) {|sum, object| sum + object.amount}
  end
  #admin注文履歴一覧の個数を合計個数にする際に使用



end
