class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  # カタカナ制限
  validates :phone_number, presence: true
  validates :postal_code,  presence: true, format: {with: /\A\d{7}\z/}
   # 郵便番号のフォーマット指定 ハイフン無し７桁固定 Viewのフォーム設定
  validates :address, presence: true

  has_many :products
  has_many :cart_items, dependent: :destroy

  def active_for_authentication?
    super && (self.user_status == true)
  end

  def full_name
    self.last_name + self.first_name
  end

  def self.search_for(content)
    Customer.where(['first_name LIKE(?) OR last_name LIKE(?) OR first_name_kana LIKE(?) OR last_name_kana LIKE(?) OR (last_name || first_name) LIKE(?) OR (last_name_kana || first_name_kana) LIKE(?)',
                    "%#{content}%","%#{content}%","%#{content}%","%#{content}%","%#{content}%","%#{content}%"])
  end
  # sqlite 文字列結合 last_name || first_name
end
