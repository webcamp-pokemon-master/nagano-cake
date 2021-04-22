class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy



# 　反映テスト
  enum payment_method: {"クレジットカード": 0, "銀行振り込み": 1 }
  enum status: {"入金待ち": 0, "入金確認": 1,"制作中": 2, "発送準備中": 3, "発送済み": 4}

  # 元の値を確認したい場合は、
  # rails c →　order = Order(1) →　order.payment_method_before_type_cast で確認
  #参考 https://qiita.com/yusuke-matsuda/items/df05c8165e2f084023b0

  # enum_help 参照http://www.monokoto.xyz/enum-help-i18n/







end
