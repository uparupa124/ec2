class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :order_price
      t.integer :order_tax_price
      t.integer :amount
      t.timestamps
    end
  end
end
