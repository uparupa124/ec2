class Item < ApplicationRecord
    
  attachment :image
  
  belongs_to :genre
  
  has_many :details, dependent: :destroy
  
  has_many :cart_items, dependent: :destroy
end
