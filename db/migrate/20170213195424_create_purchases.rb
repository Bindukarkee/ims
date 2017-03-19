class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.string :item_id
      t.string :unit_cost_price
      t.string :quantity
      t.string :cash_credit
      t.string :supplier_id

      t.timestamps
    end
  end
end
