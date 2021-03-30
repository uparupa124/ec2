class Address < ApplicationRecord
    
    belongs_to :customer
  
  validates :name, presence: true
  validates :postal_code, format: { with: /\A\d{7}\z/}
  validates :address, presence: true
  def view_address
      "〒" + self.postal_code + " " + self.address + "　" + self.name
  end
end
