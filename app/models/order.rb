class Order < ApplicationRecord
     
  belongs_to :customer
  
  has_many :details, dependent: :destroy
  
end
