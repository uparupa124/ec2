class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  # validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  # validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  # validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
  # validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :postal_code, format: { with: /\A\d{7}\z/}
  validates :address, presence: true
  validates :telephone_number, format: { with: /\A\d{10,11}\z/}
  
  
  enum is_active: {Available: true, Invalid: false}
  
  def active_for_authentication?
     super && (self.is_active === "Available")
  end

end
