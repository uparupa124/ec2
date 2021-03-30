class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :order_postal_code
      t.string :order_address
      t.string :order_telephone_number
      t.string :order_name
      t.integer :shipping
      t.integer :total_amount
      t.integer :payment
      t.timestamps
    end
  end
end
