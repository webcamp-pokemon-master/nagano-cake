class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy




  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum status: {waiting_for_payment: 0, confirm_payment: 1,under_construction: 2, ready_to_ship: 3, shipped: 4}

  # 元の値を確認したい場合は、
  # rails c →　order = Order(1) →　order.payment_method_before_type_cast で確認
  #参考 https://qiita.com/yusuke-matsuda/items/df05c8165e2f084023b0

  # enum_help 参照http://www.monokoto.xyz/enum-help-i18n/


end
