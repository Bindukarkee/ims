class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :item_id
      t.string :quantity
      t.string :unit_price
      t.string :est_sell_price

      t.timestamps
    end
  end
end
