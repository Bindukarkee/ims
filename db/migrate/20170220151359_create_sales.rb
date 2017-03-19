class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :item_id
      t.string :unit_sell_price
      t.string :quantity
      t.string :cash_credit
      t.string :customer_id

      t.timestamps
    end
  end
end
